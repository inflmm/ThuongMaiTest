# ThuongMaiTest - SpringBootLearningProject
Đây là project tìm hiểu web thương mại dựa trên trang web [GEARVN](https://gearvn.com/), sử dụng Spring Boot làm công nghệ nền tảng. Hiện tại đang chạy local.

Đồ án không còn thực hiện nữa

Cập nhật v1.1 
- Tích hợp phần frontend vào eclipse, Spring boot quản lý frontend thay vì wampserver (chạy server side rendering).
- Không còn dùng php nữa, thay vào đó là html sử dụng Thymeleaf để xử lý bù cho php. 
- Tái cấu trúc lại hệ thống front-end và back-end. Bổ sung thêm nhiều chức năng.

Cập nhật v1.2 
- Bổ sung phần admin quản lý chức năng blog, có thể thêm, xoá, chỉnh sửa bài viết bằng editor (dùng Quill editor). Có hỗ trợ chèn ảnh do hệ thống quản lý. 
- Thêm chức năng quản lý ảnh, có thể thêm ảnh vào hệ thống. Ngoài ra khi nạp ảnh vào có thể chọn toggle để nén ảnh và chuyển định dạng sang webp hoặc png.
- Chuyển sang sử dụng định dạng ảnh webp thay vì png.
- Tối ưu một số khía cạnh dựa trên đánh giá của Lighthouse của Google Chrome. (sử dụng ảnh webp, tránh dịch chuyển bố cục, giảm thời gian load một số tài nguyên).
- Sử dụng https, key tự tạo trên máy.

Những thứ có thể cải thiện tiếp: 
- Sử dụng scss để tối ưu css, tránh dư thừa css khi gửi đến client.
- Điều chỉnh cách gửi file js, tránh gửi các dòng code file js không cần thiết.
- Chế độ tablet và phone vẫn còn dịch chuyển các element nhiều.
- Thời gian kết nối tài nguyên bên thứ ba (font, icon) tốn nhiều thời gian.

# 1. Yêu cầu cài đặt
- Wampserver cho database (mySQL)
- Eclipse IDE (hoặc tương tự) để chạy back-end và xử lý front-end, cần cài thêm Springboot trong market place
- Java JDK
- WebP command-line interface tools (cwebp) để chạy nén về file webp

# 2. Cách set up
Các thư mục:
- ThuongMaiEurekaProduct: thư mục chính chạy server
- ThuongMaiEurekaServer: thư mục chạy host server
- resources: chứa file import database và thư mục rỗng dùng để chứa ảnh và bài viết (để tránh vi phạm bản quyền, dùng chức năng admin để thêm ảnh, chi tiết ở phần dưới)

1. Set up database
- Chạy Wampserver, sau đó mở phpMyAdmin trên icon hoặc vào đường dẫn http://localhost/phpmyadmin/
- Tuỳ vào config sẽ có user và password khác nhau. Nếu chạy lần đầu và không có config khác, mặc định user và password rỗng, chỉ cần nhấn vào login. (Hiện tại cài đặt user/password là root/root)
- Tạo database với tên thuongmaieureka, nếu là tên khác cần thay đổi trong file config của back-end (application.properties của project ThuongMaiEurekaProduct).
- Chọn database vừa được tạo và import database trong thư mục resources bằng file thuongmaieureka.sql.

2. Set up thư mục chứa ảnh
- Giải nén images.zip tới thư mục C:\ecommerce-uploads\images (nếu đổi đường dẫn khác cần đổi nhiều chỗ trong phần backend).
- Có thể vào trang Unsplash hoặc trang khác để tải ảnh miễn phí. Ảnh tải về nên có kích thước lớn hơn hoặc bằng 1200 pixel và phải nhỏ hơn **5MB**.

3. Cài đặt môi trường trên Eclipse 
- Mở Eclipse
- Mở Eclipse Marketplace (Help -> Eclipse Marketplace)
- Tìm kiếm với từ khoá spring sẽ hiện lên **Spring Tools (aka Spring tool Suite) 5.0.1.RELEASE** và cài đặt theo default
- Khi cài xong cho 2 thư mục ThuongMaiEurekaProduct và ThuongMaiEurekaServer workspace đã đặt trước đó

4. Kiểm tra port
Đảm bảo port 8443 và 8761 (cho server eureka) chưa sử dụng (8080 nếu không dùng https). Nếu bất kỳ port nào đã được dùng, hãy đổi sang port khác trong file application.properties phần backend và file js chứa đường dẫn api API_BASE_URL phần frontend.

5. Kiểm tra ip
- Hiện tại hệ thống chỉ chạy local nhưng các thiết bị trong cùng hệ thống mạng có thể truy cập được. Không khuyến nghịsử dụng mạng công cộng vì có nguy cơ đánh cắp thông tin.
- Vào file common.js (E...\ThuongMaiEurekaProduct\src\main\resources\static\assets\js\common.js) và file admin-core.js (E...\js\admin\admin-core.js).
- Tìm dòng const API_BASE_URL = 'http://192.168.1.**:8443'; (nếu dùng http thì đổi sang 8080 và chỉnh lại file properties).
- Mở command promt và nhập ipconfig, tìm đến dòng IPv4 address và điền vào biến API_BASE_URL ở trên. Mỗi lần khởi động lại, máy có thể sẽ được cấp một IP mới nên cần để ý trước khi chạy.
- Để có hiệu lực, vào eclipse và refresh thư mục project (trong một số trường hợp cần tắt đi bật lại server hoặc xoá cache của trình duyệt - ctrl + F5 hoặc mở inspect và tải lại).

6. Tạo Keystore nếu có vấn đề
- Vào command và nhập:
```
keytool -genkeypair -alias tomcat -keyalg RSA -keysize 2048 -storetype PKCS12 -keystore keystore.p12 -validity 3650
```

- Nhập mật khẩu 123456 để dễ nhớ, các thông tin còn lại nhấn enter bỏ qua.
- command sẽ sinh ra fil Keystore tại thư mục đang chạy lệnh (thông thường trong thư mục user).
- Cho file vào thư mục ..\ThuongMaiTest\ThuongMaiEurekaProduct\src\main\resources, nằm chung với file properties của phần backend.

# 3. Cách chạy
- Chạy Wampserver.
- Mở Eclipse IDE, Chạy project ThuongMaiEurekaServer (chuột phải project -> Run as -> Spring Boot App).
- Chạy project ThuongMaiEurekaProduct.
- Như vậy trang web có thể truy cập, trang chủ https://192.168.1.**:8443/homepage. Các thiết bị khác có thể truy cập khi dùng chung mạng.
- Đăng nhập vào trang chủ bằng email hay điện thoại là như nhau. Tài khoản: 0123123 . Mật khẩu: 123123 . Có thể tạo tài khoản bất kỳ.
- https://192.168.1.**:8443/homepage/admin để vào trang admin. Tài khoản: admin . Mật khẩu: 123456

* Bởi vì keystore này tự tạo, không phải đăng ký nên trình duyệt sẽ thông báo not secure. Nhấn vào advanced -> continue hoặc tương tự để vào trang.

# 4. Cách nạp ảnh vào hệ thống
- Vào trang admin và đăng nhập vào hệ thống.
- Chọn phần Blog và nhấn vào nút thư viện ảnh.
- Cửa sổ Thư viện ảnh hiện lên, chọn thư mục muốn thêm ảnh (nếu chưa có, cần vào thư mục image để tạo thư mục mới). Sau đó chọn Upload ảnh mới.

- Cửa sổ Tải ảnh mới lên hệ thống hiện lên, nếu bước trước không chọn gì sẽ hiển thị thư mục đích là thư mục gốc (tương đương với C:\ecommerce-uploads\images). Ta có thể upload ảnh lên thư mục bằng cách kéo ảnh hoặc nhấn vào vùng nhận file ảnh. Sau khi ảnh đã được ghi nhận, nhấn Bắt đầu tải lên sẽ tải ảnh vào hệ thống.

- Nếu nhấn vào toggle chế độ Upload sẽ chuyển sang chế độ nén ảnh và đổi format, mặc định là webp (nên dùng loại này), format còn lại là jpg. Lưu ý bổ sung slug của sản phẩm thì mới cho phép chạy (vd: pc-gvn-intel-i5-12400f-vga-rtx3050). Khi chạy xong, hệ thống sẽ tạo thư mục có tên là slug đã nhập, bên trong chứa 3 thư mục tương ứng với 3 kích thước (master > grande > compact). Có thể chọn thư mục có sẵn để thêm ảnh mới vào.
