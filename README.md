# Xây dựng kho dữ liệu cho cửa hàng thuê đĩa DVD

- [Rental Sakila Project](#rental-sakila-project)
  - [1. Giới thiệu đề tài](#1-giới-thiệu-đề-tài)
  - [2. Thông tin về dataset](#2-thông-tin-về-dataset)
  - [3.1 Nội dung chính dự án](#31-nội-dung-chính-dự-án)
    - [3.1 Xây dựng kho dữ liệu bằng công cụ SSIS](#31-xây-dựng-kho-dữ-liệu-bằng-công-cụ-ssis)
    - [3.2. Xây dựng cube và truy vấn bằng công cụ SSAS](#32-xây-dựng-cube-và-truy-vấn-bằng-công-cụ-ssas)
    - [3.3. Xây dựng Dashboard](#33-xây-dựng-dashboard)
## 1. Giới thiệu đề tài
 Sakila là tập dataset sử dụng để học và nghiên cứu quản lý cơ sở dữ liệu. Nhận thấy rằng xây dựng một kho dữ liệu cho ngành bán lẻ có thể giúp các doanh nghiệp tối ưu hóa hoạt động kinh doanh. Thị trường bán lẻ đang phát triển nhanh chóng, và việc thu thập và phân tích dữ liệu là rất quan trọng để đưa ra quyết định chiến lược và tận dụng nguồn lực. Xây dựng kho dữ liệu hiệu quả giúp giảm thiểu sự phân tán và không chính xác của dữ liệu, cùng với việc tăng cường khả năng phân tích và dự báo kinh doanh. Do đó, việc dựng kho dữ liệu cho ngành bán lẻ, đặc biệt là cho thuê băng đĩa phim, là cần thiết và có ý nghĩa lớn để tối ưu hoá hoạt động kinh doanh trong thị trường cạnh tranh ngày này.
 
## 2. Thông tin về dataset
Dataset được lấy từ https://www.kaggle.com/datasets/atanaskanev/sqlite-sakila-sample-database

Sau khi nghiên cứu, thì em đã lấy ra các thuộc tính và các bảng cần thiết cho dự án của mình, bao gồm các bảng:
- Address: lưu thông tin địa chỉ
- Actor: thông tin các diễn viên trong một bộ phim
- Customer: thông tin về khách hàng
- Category: các thể loại phim
- Date: lưu thông tin ngày tháng thuê
- Film: thông tin chi tiết về bộ phim
- Store: thông tin cửa hàng
- Staff: thông tin nhân viên
- Rental: thông tin giao dịch ngày thuê, ngày trả và giá cả cho thuê

## 3. Nội dung chính dự án

### 3.1 Xây dựng kho dữ liệu bằng công cụ SSIS
- Tạo StageSakila lưu trữ các table stage và DWHSakila lưu trữ các tabel Dim - Fact
- Đổ dữ liệu từ excel vào các bảng stage
- Đổ dữ liệu từ stage vào các bảng Dim và Fact
- Tạo các khoá ngoại giữa các bảng Fact và các bảng Dim

### 3.2. Xây dựng cube và truy vấn bằng công cụ SSAS
- Tạo Data Source từ kho dữ liệu database DWHSakila
- Tạo Data Source View
- Tạo cube, thêm measure và các dim cần thiết
- Truy vấn các câu hỏi mà nhóm đưa ra bằng công cụ SSAS, Pivot Table, PowerBI

### 3.3. Xây dựng Dashboard với PowerBI
- Dashboard báo cáo doanh thu 
[![dashboard-sales-reporting.png](https://i.postimg.cc/DZL56Pv2/dashboard-sales-reporting.png)](https://postimg.cc/mzZQ2M1q)
- Dashboard thông kê những yếu tố nổi bật theo thời gian 
![dashboard_sales_reporting](https://i.postimg.cc/W1sRkt7F/dashboard-list-top.png)
| Tên thuộc tính    | Mô tả                                                                                                                                     | 
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| CensusTract       | Mã số định danh cho từng khu dân cư trong tập dữ liệu                                                                                     |
| State             | Mã số định danh cho bang hoặc lãnh thổ liên bang Hoa Kỳ                                                                                   |
| County            | Tên của quận hoặc hạt nằm trong bang đó.                                                                                                  |
| TotalPop          | Tổng số dân trong khu dân cư                                                                                                              |
| Men               | Số lượng nam giới trong khu dân cư                                                                                                        |
| Women             | Số lượng nữ giới trong khu dân cư                                                                                                         |
| White             | Số lượng người da trắng trong khu dân cư                                                                                                  |
| Black             | Số lượng người da đen trong khu dân cư                                                                                                    |
| Native            | Số lượng người da bản địa trong khu dân cư                                                                                                |
| Asian             | Số lượng người châu Á trong khu dân cư                                                                                                    |
| Pacific           | Số lượng người châu Đại Dương trong khu dân cư                                                                                            |
| Citizen           | Số lượng công dân Hoa Kỳ trong khu dân cư                                                                                                 |
| Income            | Tổng thu nhập hộ gia đình trung bình trong khu dân cư                                                                                     |
| IncomeErr         | Sai số (độ lệch chuẩn) của thu nhập hộ gia đình trong khu dân cư                                                                          |
| IncomePerCap      | Thu nhập trung bình đối với mỗi cá nhân trong khu dân cư                                                                                  |
| IncomePerCapErr   | Sai số (độ lệch chuẩn) của thu nhập trung bình đối với mỗi cá nhân trong khu dân cư                                                       |
| Poverty           | Tỷ lệ dân số trong khu dân cư ở mức sống dưới mức nghèo                                                                                   |
| ChildPoverty      | Tỷ lệ trẻ em trong khu dân cư ở mức sống dưới mức nghèo                                                                                   |
| Professional      | Số lượng người làm việc trong ngành nghề chuyên nghiệp trong khu dân cư                                                                   |
| Service           | Số lượng người làm việc trong ngành dịch vụ trong khu dân cư                                                                              |
| Office            | Số lượng người làm việc trong ngành văn phòng trong khu dân cư                                                                            |
| Construction      | Số lượng người làm việc trong ngành xây dựng trong khu dân cư                                                                             |
| Production        | Số lượng người làm việc trong ngành sản xuất trong khu dân cư                                                                             |
| Drive             | Số lượng người đi xe cá nhân đến nơi làm việc trong khu dân cư                                                                            |
| Carpool           | Số lượng người đi chung xe đến nơi làm việc trong khu dân cư                                                                              |
| Transit           | Số lượng người sử dụng phương tiện công cộng để đến nơi làm việc trong khu dân cư                                                         |  |
| Walk              | Số lượng người đi bộ đến nơi làm việc trong khu dân cư                                                                                    |
| OtherTransp       | Số lượng người sử dụng phương tiện giao thông khác (ngoại trừ xe cá nhân, xe chung, và giao thông công cộng) để đi làm trong khu dân cư   |
| WorkAtHome        | Số lượng người làm việc tại nhà trong khu dân cư                                                                                          |
| MeanCommute       | Thời gian đi làm trung bình của người dân trong khu dân cư                                                                                |
| Employed          | Số lượng người đang có việc làm trong khu dân cư                                                                                          |
| PrivateWork       | Tỷ lệ người làm việc trong doanh nghiệp tư nhân trong khu dân cư                                                                          |
| PublicWork        | Tỷ lệ người làm việc trong cộng đồng trong khu dân cư                                                                                     |
| SelfEmployed      | Tỷ lệ người tự làm chủ (làm việc tự do, kinh doanh riêng) trong khu dân cư                                                                |
| FamilyWork        | Tỷ lệ người làm việc trong công việc gia đình (làm việc trong doanh nghiệp gia đình) trong khu dân cư                                     |
| Unemployment      | Tỷ lệ người thất nghiệp trong khu dân cư                                                                                                  |

