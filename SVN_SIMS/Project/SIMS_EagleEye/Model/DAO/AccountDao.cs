using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.Entity;

namespace Model.DAO
{
    public class AccountDao
    {
        private Sims context = null;

        public AccountDao()
        {
            context = new Sims();
        }

        /// <summary>
        /// VI:Thêm tài khoản. EN: Insert account
        /// </summary>
        /// <param name="username">VI:tên tải khoản. EN: Name of User</param>
        /// <param name="password">VI:mật khẩu tải khoản. EN: Password of User</param>
        /// <param name="fullname">VI:Tên đầy đủ tải khoản. EN: Tên đầy đủ of User</param>
        /// <param name="sdt">VI:SDT tải khoản. EN: PhoneNumber of User</param>
        /// <param name="role">VI:Quyền tải khoản. EN: Role of User</param>
        /// <param name="status">VI:Trạng thái tải khoản. EN: Status of User</param>
        /// <returns>VI:trả về một giá trị số nguyên đại diện cho quá trình thêm tài khoản. EN: the return result is a value which represent for process insert.</returns>
        public int Insert(string username,string password,string fullname,int? sdt,string role,bool? status)
        {
            
            object[] sqlParams =
            {
                new SqlParameter("@UseName",username),
                new SqlParameter("@Password", password),
                new SqlParameter("@FullName",fullname),
                new SqlParameter("@SDT",sdt),
                new SqlParameter("@CreateDate",SqlDbType.DateTime).Value = DateTime.Now.ToString("yy-MM-dd"),//automatic convert to sql datetime.
                new SqlParameter("@Role",role),
                new SqlParameter("@Status",status)
            };
            var result = context.Database.ExecuteSqlCommand("InsertAcc", parameters: sqlParams);
            return result;
        }

        /// <summary>
        /// VI:Cập nhật tài khoản. EN: Update account
        /// </summary>
        /// <param name="username">VI:tên tải khoản. EN: Name of User</param>
        /// <param name="fullname">VI:Tên đầy đủ tải khoản. EN: Tên đầy đủ of User</param>
        /// <param name="sdt">VI:SDT tải khoản. EN: PhoneNumber of User</param>
        /// <param name="role">VI:Quyền tải khoản. EN: Role of User</param>
        /// <param name="status">VI:Trạng thái tải khoản. EN: Status of User</param>
        /// <returns>VI:trả về một giá trị số nguyên đại diện cho quá trình cập nhật tài khoản. EN: the return result is a value which represent for process update.</returns>
        public int Update(string username, string fullname, int? sdt, string role, bool? status)
        {
            object[] sqlParams =
            {
                new SqlParameter("@UseName",username),
                new SqlParameter("@FullName",fullname),
                new SqlParameter("@SDT",sdt),
                new SqlParameter("@CreateDate",SqlDbType.DateTime).Value = DateTime.Now.ToString("yy-MM-dd"),//automatic convert to sql datetime.
                new SqlParameter("@Role",role),
                new SqlParameter("@Status",status)
            };
            var result = context.Database.ExecuteSqlCommand("UpdateAcc", parameters: sqlParams);
            return result;  
        }

        /// <summary>
        /// VI:Xóa tài khoản. EN: Delete account.
        /// </summary>
        /// <param name="username">VI:tên tải khoản. EN: Name of User</param>
        /// <returns>VI:trả về một giá trị số nguyên đại diện cho quá trình xóa tài khoản. EN: the return result is a value which represent for process delete.</returns>
        public int Delete(string username)
        {
            var result = context.Database.ExecuteSqlCommand("CheckUserName @username", username);
            return result;
        }

        /// <summary>
        /// VI:Thay đổi trạng thái tài khoản. EN:Change Status account
        /// </summary>
        /// <param name="username">VI:tên tải khoản. EN: Name of User</param>
        /// <returns></returns>
        public int ChangeStatus(string username)
        {
            var result = context.Database.ExecuteSqlCommand("CheckUserName @username", username);
            return result;
        }

        /// <summary>
        /// VI:Chi tiết tài khoản. EN:Chi tiết tài khoản.
        /// </summary>
        /// <param name="username">VI:tên tải khoản. EN: Name of User</param>
        /// <returns></returns>
        public Account ViewDetail(string username)
        {
            var result = context.Database.SqlQuery<Account>("ViewDetail @username", username).SingleOrDefault();
            return result;
        }

        /// <summary>
        /// VI:Lấy danh sách tài khoản. EN: Get List of Account. 
        /// </summary>
        /// <returns>VI:Danh sách tài khoản sau khi truy vấn. EN: List account after query into table account.</returns>
        public List<Account> ListAll()
        {
            var result = context.Database.SqlQuery<Account>("GETLISTACC");
            return result.ToList();
        }  

        /// <summary>
        /// VI:Dựa vào username để lấy tài khoản. EN: Base on username to get account
        /// </summary>
        /// <param name="username">VI:tên tải khoản. EN: Name of User</param>
        /// <returns>VI:trả về tài khoản. EN: return a account </returns>
        public Account GetByUserName(string username)
        {
            var result = context.Database.SqlQuery<Account>("GetByUserName @username", username).SingleOrDefault();
            return result;
        }
       
        /// <summary>
        /// VI:Kiểm tra quá trình đăng nhập tài khoản. EN: Check process login.
        /// </summary>
        /// <param name="username">VI:tên tải khoản. EN: Name of User</param>
        /// <param name="password">VI:mật khẩu tải khoản. EN: Password of User</param>
        /// <param name="isLoginAdmin">VI:Có phải là admin EN: who is admin?</param>
        /// <returns>VI:trả về một giá trị số nguyên đại diện cho quá trình đăng nhập. EN: the return result is a value which represent for process login.</returns>
        public int Login(string username, string password, bool isLoginAdmin = false)
        {
            object[] sqlParams =
            {
                new SqlParameter("@username",username),
                new SqlParameter("@password", password),
                new SqlParameter("@isloginadmin",isLoginAdmin)
            };
            var result = context.Database.SqlQuery<int>("Login @username,@password,@isloginadmin", parameters: sqlParams).SingleOrDefault();
            return result;
        }

        /// <summary>
        /// VI:Kiểm tra tài khoản có tồn tại. EN: Check exits of account
        /// </summary>
        /// <param name="username">VI:tên tải khoản. EN: Name of User</param>
        /// <returns>trả về một giá trị số nguyên đại diện cho kiểm tra tài khoản. EN: the return result is a value which represent for process check account.</returns>
        public int CheckUserName(string username)
        {
            var result = context.Database.SqlQuery<int>("CheckUserName @username", username).SingleOrDefault();
            return result;
        }

        /// <summary>
        /// VI: Kiểm tra số điện thoại đã được đăng ký chưa. EN: Check for NumberPhone exits.
        /// </summary>
        /// <param name="username">VI:tên tải khoản. EN: Name of User</param>
        /// <param name="sdt">VI:SDT tải khoản. EN: PhoneNumber of User</param>
        /// <returns>trả về một giá trị số nguyên đại diện cho quá trình kiểm tra số điện thoại. EN: the return result is a value which represent for process check numberphone.</returns>
        public int CheckNumberPhone(string username,int sdt)
        {
            object[] sqlParams =
            {
                new SqlParameter("@username",username),
                new SqlParameter("@SDT", sdt)
            };
            
            var result = context.Database.SqlQuery<int>("CheckNumberPhone @username,@SDT", username).SingleOrDefault();
            return result;
        }
    }
}
