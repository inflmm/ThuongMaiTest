# ThuongMaiTest
Đây là project web thương mại dựa trên trang web [GEARVN](https://gearvn.com/) 
Hiện tại đang chạy local

Cập nhật v2 - tích hợp phần frontend vào eclipse, Spring boot quản lý frontend thay vì wampserver. Không còn dùng php nữa, thay vào đó là html sử dụng Thymeleaf để xử lý bù cho php. Tái cấu trúc lại hệ thống front-end và back-end. Bổ sung thêm nhiều chức năng. Viết thêm design document. 

# 1. Yêu cầu cài đặt
- Wampserver cho database (mySQL)
- Eclipse IDE (hoặc tương tự) để chạy back-end và xử lý front-end
- Java JDK
- 

# 2. Cách set up
Các thư mục:
- ThuongMaiEurekaProduct: thư mục chính chạy server
- ThuongMaiEurekaServer: thư mục chạy host server
- resources: chứa file import database và thư mục chứa ảnh

1. Set up database
- Chạy Wampserver, sau đó mở phpMyAdmin trên icon hoặc vào đường dẫn http://localhost/phpmyadmin/
- Tạo database với tên thuongmaieureka, nếu là tên khác cần thay đổi trong file config trong front-end (config.inc) và back-end (application.properties của project ThuongMaiEurekaProduct)
- Chọn database vừa được tạo và import database trong thư mục resources

2. Set up thư mục chứa ảnh
- Giải nén images.zip tới thư mục: C:\ecommerce-uploads\images
- *Nếu chưa có cần tự tạo thư mục mới
- *Nếu dùng thư mục khác cần vào file WebConfig.java (...\ThuongMaiEurekaProduct\src\main\java\com\example\demo\config\WebConfig.java) để thay đổi đường dẫn tương ứng

3. Cài đặt môi trường trên Eclipse 
- Mở Eclipse
- Mở Eclipse Marketplace (Help -> Eclipse Marketplace)
- Tìm kiếm với từ khoá spring sẽ hiện lên **Spring Tools (aka Spring tool Suite) 5.0.1.RELEASE** và cài đặt theo default
- Khi cài xong cho 2 thư mục ThuongMaiEurekaProduct và ThuongMaiEurekaServer workspace đã đặt trước đó

4. Kiểm tra port
Đảm bảo port 8080 và 8081 chưa sử dụng. Nếu bất kỳ port nào đã được dùng, hãy đổi sang port khác trong file application.properties.

5. Kiểm tra ip
- Hiện tại hệ thống chỉ chạy local nhưng các thiết bị trong cùng hệ thống mạng có thể truy cập được. Không khuyến sử dụng mạng công cộng có thể dẫn đến đánh cắp thông tin.
- Vào file common.js (E...\ThuongMaiEurekaProduct\src\main\resources\static\assets\js\common.js)
- Tìm dòng const API_BASE_URL = 'http://192.168.1.**:8080';
- Mở command promt và nhập ipconfig, tìm đến dòng IPv4 address và điền vào biến API_BASE_URL ở trên. Mỗi lần khởi động lại, máy sẽ được cấp một IP mới nên cần để ý trước khi chạy.
- Để có hiệu lực, vào eclipse và refresh thư mục project (trong một số trường hợp cần tắt đi bật lại server)
- *Nếu chỉ muốn dùng localhost, đổi sang API_BASE_URL = 'http://localhost:8080 .

# 3. Cách chạy
- Chạy Wampserver
- Mở Eclipse IDE, Chạy project ThuongMaiEurekaServer (chuột phải project -> Run as -> Spring Boot App)
- Chạy project ThuongMaiEurekaProduct
- Như vậy trang web có thể truy cập, trang chủ http://192.168.1.**:8080/homepage (hoặc http://localhost:8080/homepage). Các thiết bị khác có thể truy cập khi dùng chung mạng.
