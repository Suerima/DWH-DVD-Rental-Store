# Rental Sakila Project

- [Rental Sakila Project](#rental-sakila-project)
  - [1. Giới thiệu đề tài](#1-giới-thiệu-đề-tài)
  - [2. Thông tin về dataset](#2-thông-tin-về-dataset)
  - [3.1 Nội dung chính dự án](#31-nội-dung-chính-dự-án)
    - [3.1 Xây dựng kho dữ liệu bằng công cụ SSIS](#31-xây-dựng-kho-dữ-liệu-bằng-công-cụ-ssis)
    - [3.2. Xây dựng cube và truy vấn bằng công cụ SSAS](#32-xây-dựng-cube-và-truy-vấn-bằng-công-cụ-ssas)
    - [3.3. Xây dựng Dashboard](#33-xây-dựng-dashboard)
## 1. Giới thiệu đề tài
 Sakila là tập dataset sử dụng để học và nghiên cứu quản lý cơ sở dữ liệu. Chúng em nhận thấy rằng xây dựng một kho dữ liệu cho ngành bán lẻ có thể giúp các doanh nghiệp tối ưu hóa hoạt động kinh doanh. Thị trường bán lẻ đang phát triển nhanh chóng, và việc thu thập và phân tích dữ liệu là rất quan trọng để đưa ra quyết định chiến lược và tận dụng nguồn lực. Xây dựng kho dữ liệu hiệu quả giúp giảm thiểu sự phân tán và không chính xác của dữ liệu, cùng với việc tăng cường khả năng phân tích và dự báo kinh doanh. Do đó, nhóm chúng em xây dựng kho dữ liệu cho ngành bán lẻ, đặc biệt là cho thuê băng đĩa phim, là cần thiết và có ý nghĩa lớn để tối ưu hoá hoạt động kinh doanh trong thị trường cạnh tranh ngày này.
 
 **Trong dự án này bao gồm**:
- 1 File báo cáo word
- 1 File thuyết trình ppt
- 1 File video nhóm thuyết trình
- 1 Folder project SSAS
- 1 Folder project SSIS
- 1 File dataset
- 1 File tạo table
- 1 File README

## 2. Thông tin về dataset
Dataset được lấy từ https://www.kaggle.com/datasets/atanaskanev/sqlite-sakila-sample-database

Sau khi nghiên cứu, thì nhóm chúng em đã lấy ra các thuộc tính và các bảng cần thiết cho dự án của mình, bao gồm các bảng:
- Address: lưu thông tin địa chỉ
- Actor: thông tin các diễn viên trong một bộ phim
- Customer: thông tin về khách hàng
- Category: các thể loại phim
- Date: lưu thông tin ngày tháng thuê
- Film: thông tin chi tiết về bộ phim
- Store: thông tin cửa hàng
- Staff: thông tin nhân viên
- Rental: thông tin giao dịch ngày thuê, ngày trả và giá cả cho thuê

## 3.1 Nội dung chính dự án

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

### 3.3. Xây dựng Dashboard
- Dashboard báo cáo doanh thu
- Dashboard thông kê những yếu tố nổi bật theo thời gian