﻿using PregnancyGrowthTracking.DAL.DTOs;
using PregnancyGrowthTracking.DAL.Entities;
using PregnancyGrowthTracking.DAL.Repositories;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace PregnancyGrowthTracking.BLL.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;

        public UserService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        //  Lấy tất cả User
        public async Task<IEnumerable<UserResponseDto>> GetAllUsersAsync()
        {
            var users = await _userRepository.GetAllUsersAsync();

            return users.Select(u => new UserResponseDto
            {
                UserId = u.UserId,
                UserName = u.UserName,
                FullName = u.FullName,
                Email = u.Email,
                Phone = u.Phone,
                ProfileImageUrl = u.ProfileImageUrl,
                Dob = u.Dob,
                Available = u.Available ?? false,  
                RoleId = u.RoleId ?? 0,            
                Role = u.Role?.Role1               
            }).ToList();
        }


        //  Lấy User theo ID
        public async Task<UserResponseDto?> GetUserByIdAsync(int id)
        {
            var user = await _userRepository.GetUserByIdAsync(id);
            return user == null ? null : new UserResponseDto
            {
                UserId = user.UserId,
                UserName = user.UserName,
                FullName = user.FullName,
                Email = user.Email,
                Phone = user.Phone,
                ProfileImageUrl = user.ProfileImageUrl,
                Dob = user.Dob,
                Available = user.Available ?? false,
                RoleId = user.RoleId ?? 0,
                Role = user.Role?.Role1
            };
        }

        //  Tạo User mới
        public async Task<UserResponseDto> CreateUserAsync(UserCreateDto request)
        {
            // Kiểm tra Username đã tồn tại chưa
            if (await _userRepository.UserNameExistsAsync(request.UserName))
                throw new Exception("Username already exists");

            var user = new User
            {
                UserName = request.UserName,
                FullName = request.FullName,
                Email = request.Email,
                Password = request.Password, // Lưu ý: Không hash mật khẩu ở đây
                Dob = request.Dob,
                Phone = request.Phone,
                Available = request.Available,
                RoleId = request.RoleId
            };

            var createdUser = await _userRepository.CreateUserAsync(user);

            return new UserResponseDto
            {
                UserId = createdUser.UserId,
                UserName = createdUser.UserName,
                FullName = createdUser.FullName,
                Email = createdUser.Email
            };
        }

        //  Cập nhật User
        public async Task<bool> UpdateUserAsync(int id, UserUpdateDto request)
        {
            var user = await _userRepository.GetUserByIdAsync(id);
            if (user == null) return false;

            // Chỉ cập nhật các trường không null
            if (!string.IsNullOrEmpty(request.UserName)) user.UserName = request.UserName;
            if (!string.IsNullOrEmpty(request.FullName)) user.FullName = request.FullName;
            if (!string.IsNullOrEmpty(request.Email)) user.Email = request.Email;
            if (!string.IsNullOrEmpty(request.Password)) user.Password = request.Password;
            if (request.Dob.HasValue) user.Dob = request.Dob;
            if (!string.IsNullOrEmpty(request.Phone)) user.Phone = request.Phone;
            if (request.Available.HasValue) user.Available = request.Available;
            if (request.RoleId.HasValue) user.RoleId = request.RoleId;

            return await _userRepository.UpdateUserAsync(user);
        }

        //  Xóa User
        public async Task<bool> DeleteUserAsync(int id)
        {
            return await _userRepository.DeleteUserAsync(id);
        }

        public async Task<bool> UpdateUserProfileImageAsync(int userId, string imageUrl)
        {
            return await _userRepository.UpdateUserProfileImageAsync(userId, imageUrl);
        }

        public async Task<string?> GetUserProfileImageAsync(int userId)
        {
            //  Gọi repository để lấy URL ảnh
            return await _userRepository.GetUserProfileImageAsync(userId);
        }

        public async Task<bool> DeleteUserProfileImageAsync(int userId)
        {
            //  Gọi tới repository
            return await _userRepository.DeleteUserProfileImageAsync(userId);
        }

        public async Task<IEnumerable<UserResponseDto>> SearchUsersByKeywordAsync(string keyword)
        {
            if (string.IsNullOrWhiteSpace(keyword)) return new List<UserResponseDto>();

            // Loại bỏ số và ký tự đặc biệt, chỉ giữ lại chữ cái và khoảng trắng
            keyword = Regex.Replace(keyword, "[^a-zA-Z\\s]", "").Trim();

            var users = await _userRepository.SearchUsersByKeywordAsync(keyword);

            return users.Select(u => new UserResponseDto
            {
                UserId = u.UserId,
                UserName = u.UserName,
                FullName = u.FullName,
                Email = u.Email,
                Phone = u.Phone,
                ProfileImageUrl = u.ProfileImageUrl,
                Dob = u.Dob,
                Available = u.Available ?? false,  
                RoleId = u.RoleId ?? 0,
                Role = u.Role?.Role1  
            }).ToList();
        }

    }
}
