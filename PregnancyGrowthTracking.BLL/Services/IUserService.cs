﻿using PregnancyGrowthTracking.DAL.DTOs;
using PregnancyGrowthTracking.DAL.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PregnancyGrowthTracking.BLL.Services
{
    public interface IUserService
    {
        Task<IEnumerable<UserResponseDto>> GetAllUsersAsync();
        Task<UserResponseDto?> GetUserByIdAsync(int id);
        Task<UserResponseDto> CreateUserAsync(UserCreateDto request);
        Task<bool> UpdateUserAsync(int id, UserUpdateDto request);
        Task<bool> DeleteUserAsync(int id);
        Task<bool> UpdateUserProfileImageAsync(int userId, string imageUrl);
        Task<string?> GetUserProfileImageAsync(int userId);
        Task<bool> DeleteUserProfileImageAsync(int userId);
        Task<IEnumerable<UserResponseDto>> SearchUsersByKeywordAsync(string keyword);
        Task<bool> UpdateUserProfileAsync(int userId, UserSelfUpdateDto request);
        Task<UserProfileResponseDto?> GetUserProfileAsync(int userId);
    }
}
