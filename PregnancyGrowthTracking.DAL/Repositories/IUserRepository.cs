﻿using PregnancyGrowthTracking.DAL.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PregnancyGrowthTracking.DAL.Repositories
{
    public interface IUserRepository
    {
        Task<IEnumerable<User>> GetAllUsersAsync();
        Task<User?> GetUserByIdAsync(int id);
        Task<User> CreateUserAsync(User user);
        Task<bool> UpdateUserAsync(User user);
        Task<bool> DeleteUserAsync(int id);
        Task<bool> UserNameExistsAsync(string userName);
        Task<bool> UpdateUserProfileImageAsync(int userId, string imageUrl);
        Task<string?> GetUserProfileImageAsync(int userId);
        Task<bool> DeleteUserProfileImageAsync(int userId);
        Task<IEnumerable<User>> SearchUsersByKeywordAsync(string keyword);

        Task<User?> GetUserProfileAsync(int userId);

    }
}
