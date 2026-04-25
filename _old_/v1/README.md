# ThuongMaiTest
Đây là project web thương mại dựa trên trang web [GEARVN](https://gearvn.com/) 
Hiện tại đang chạy local

# 1. Yêu cầu cài đặt
- Wampserver cho database (posgres) và php
- Eclipse IDE (hoặc tương tự) để chạy back-end
- Java JDK
- 

# 2. Cách set up
Các thư mục:
- Front-end: chứa các file cho phần front-end
- Back-end: chứa các file cho phần back-end
- resources: chứa file để import database và thư mục chứa ảnh

1. Set up database
- Chạy Wampserver, sau đó mở phpMyAdmin trên icon hoặc vào đường dẫn http://localhost/phpmyadmin/
- Tạo database với tên thuongmaieureka, nếu là tên khác cần thay đổi trong file config trong front-end (config.inc) và back-end (application.properties của project ThuongMaiEurekaProduct)
- Chọn database vừa được tạo và import database trong thư mục resources

2. Set up thư mục chứa ảnh
- Giải nén thư mục images.zip
- Trong file WebConfig.java (của project ThuongMaiEurekaProduct) thay đổi đường dẫn tới nơi đã giải nén file vừa rồi

3. Cài đặt môi trường trên Eclipse 
- Mở Eclipse
- Mở Eclipse Marketplace (Help -> Eclipse Marketplace)
- Tìm kiếm với từ khoá spring sẽ hiện lên **Spring Tools (aka Spring tool Suite) 5.0.1.RELEASE** và cài đặt theo default

4. Kiểm tra port
Đảm bảo port 8080 và 8081 chưa sử dụng. Nếu bất kỳ port nào đã được dùng, hãy đổi sang port khác trong file application.properties.

# 3. Cách chạy
- Chạy Wampserver
- Mở Eclipse IDE, Chạy project ThuongMaiEurekaServer (chuột phải project -> Run as -> Spring Boot App)
- Chạy project ThuongMaiEurekaProduct
Như vậy trang web có thể truy cập, trang chủ http://localhost/ThuongMaiTest/views/homepage.php