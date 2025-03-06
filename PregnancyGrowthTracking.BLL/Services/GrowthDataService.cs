﻿using PregnancyGrowthTracking.DAL.DTOs;
using PregnancyGrowthTracking.DAL.Entities;
using PregnancyGrowthTracking.DAL.Repositories;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PregnancyGrowthTracking.BLL.Services
{
    public class GrowthDataService : IGrowthDataService
    {
        private readonly IGrowthDataRepository _growthDataRepository;
        private readonly IFoetusRepository _foetusRepository;
        private readonly IGrowthStandardRepository _growthStandardRepository;

        public GrowthDataService(IGrowthDataRepository growthDataRepository, IFoetusRepository foetusRepository, IGrowthStandardRepository growthStandardRepository)
        {
            _growthDataRepository = growthDataRepository;
            _foetusRepository = foetusRepository;
            _growthStandardRepository = growthStandardRepository;
        }

        public async Task<bool> IsAddOrUpdate(int foetusId, int userId, GrowthDataDto request)
        {
            bool isOwnedByUser = await _foetusRepository.IsFoetusOwnedByUserAsync(foetusId, userId);
            if (!isOwnedByUser)
            {
                throw new UnauthorizedAccessException("You do not have permission to modify this data.");
            }

            var currentGrowthData = await _growthDataRepository.GetGrowthDataByFoetusIdAndAge(foetusId, request.Age);

            if (currentGrowthData == null)
            {
                return await AddGrowthDataAsync(foetusId, request);
            }
            else
            {
                return await UpdateGrowthDataAsync(foetusId, request);
            }
        }

        public async Task<bool> AddGrowthDataAsync(int foetusId, GrowthDataDto request)
        {
            var foetus = await _foetusRepository.GetFoetusByIdAsync(foetusId);
            if (foetus == null)
            {
                throw new KeyNotFoundException("Foetus not found.");
            }

            // Cập nhật GestationalAge trong bảng Foetus
            await _foetusRepository.UpdateGestationalAgeAsync(foetusId, request.Age);

            int? growthStandardId = await _growthDataRepository.GetGrowthStandardIdByAgeAsync(request.Age);
            if (growthStandardId == null)
            {
                throw new ArgumentException("No growth standard found for the given age.");
            }

            // Kiểm tra nếu đây là lần nhập dữ liệu đầu tiên
            bool hasExistingData = await _growthDataRepository.HasGrowthDataAsync(foetusId);

            if (!hasExistingData && foetus.ExpectedBirthDate == null)
            {
                DateTime expectedBirthDate = DateTime.UtcNow.AddDays((40 - request.Age) * 7);
                await _foetusRepository.UpdateExpectedBirthDateAsync(foetusId, expectedBirthDate);
            }

            var growthData = new GrowthDatum
            {
                FoetusId = foetusId,
                Date = DateOnly.FromDateTime(DateTime.UtcNow),
                GrowthStandardId = growthStandardId.Value,
                Age = request.Age,
                Hc = request.HC,
                Ac = request.AC,
                Fl = request.FL,
                Efw = request.EFW
            };

            return await _growthDataRepository.AddGrowthDataAsync(growthData);
        }

        public async Task<IEnumerable<GrowthDataResponseDto>> GetGrowthDataByFoetusIdAsync(int foetusId, int userId)
        {
            // ✅ Kiểm tra xem thai nhi có thuộc về mẹ không
            bool isOwnedByUser = await _foetusRepository.IsFoetusOwnedByUserAsync(foetusId, userId);
            if (!isOwnedByUser)
            {
                throw new UnauthorizedAccessException("You do not have permission to view this data.");
            }

            var growthDataList = await _growthDataRepository.GetGrowthDataByFoetusIdAsync(foetusId);

            return growthDataList.Select(gd => new GrowthDataResponseDto
            {
                GrowthDataId = gd.GrowthDataId,
                Age = gd.Age ?? 0,
                HC = gd.Hc ?? 0, // ✅ Đảm bảo không bị null
                AC = gd.Ac ?? 0,
                FL = gd.Fl ?? 0,
                EFW = gd.Efw ?? 0,
                GrowthStandardId = gd.GrowthStandardId ?? 0, // ✅ Ép kiểu cho int?
                Date = gd.Date.HasValue ? gd.Date.Value.ToString("yyyy-MM-dd") : null
            }).ToList();
        }

        public async Task<bool> UpdateGrowthDataAsync(int foetusId, GrowthDataDto request)
        {
            var growthData = await _growthDataRepository.GetGrowthDataByFoetusIdAndAge(foetusId, request.Age);
            if (growthData == null)
            {
                throw new KeyNotFoundException($"Growth data not found for foetus {foetusId} at age {request.Age}");
            }

            // Chỉ cập nhật các giá trị được cung cấp, giữ nguyên các giá trị cũ nếu không được cung cấp
            if (request.HC.HasValue) growthData.Hc = request.HC;
            if (request.AC.HasValue) growthData.Ac = request.AC;
            if (request.FL.HasValue) growthData.Fl = request.FL;
            if (request.EFW.HasValue) growthData.Efw = request.EFW;

            // Cập nhật ngày chỉnh sửa
            growthData.Date = DateOnly.FromDateTime(DateTime.UtcNow);

            return await _growthDataRepository.UpdateGrowthDataAsync(growthData);
        }
    }
}
