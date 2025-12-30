# README

## 1. Tổng quan
Đây là project mẫu cho bài tập lập trình C với hệ thống chấm điểm tự động. Sinh viên chỉ cần chỉnh sửa file `main.c`, mọi thứ khác trong thư mục `autograder` sẽ chạy tự động để kiểm tra kết quả.

## 2. Cấu trúc thư mục
```
.
|___main.c
|___README.md
|___autograder
    |___Makefile
    |___runner.sh
    |___data
        |___1.txt
        |___2.txt
        |___3.txt
        |___4.txt
        |___5.txt
```

## 3. Giải thích từng file
- **`main.c`**: File chính mà sinh viên cần chỉnh sửa để giải bài tập.
- **`Makefile`**: File cấu hình để build chương trình, chạy test case và dọn dẹp.
- **`runner.sh`**: Script tự động chạy các test case và so sánh kết quả.
- **`data/*.txt`**: Các file test case. Mỗi file chứa input và output mẫu, được phân cách bởi `---`.

## 4. Hướng dẫn sử dụng
### Build chương trình
Chạy lệnh sau để build chương trình:
```
make
```

### Chạy tất cả test case
Chạy lệnh sau để kiểm tra tất cả test case:
```
make test
```

### Chạy test case cụ thể
Chạy lệnh sau để kiểm tra một test case cụ thể (ví dụ: test1):
```
make test1
```

### Dọn dẹp file build
Chạy lệnh sau để xóa các file build:
```
make clean
```

## 5. Định dạng test case
- Mỗi file test case trong thư mục `data/` có định dạng:
```
<input>
---
<output>
```
- `input`: Dữ liệu đầu vào, có thể nhiều dòng.
- `output`: Kết quả mong đợi, có thể nhiều dòng.

## 6. Thêm hoặc thay đổi test case
- Để thêm test case mới:
  1. Tạo file mới trong thư mục `data/` với định dạng `input --- output`.
  2. Script `runner.sh` sẽ tự động nhận diện file mới.
- Nếu muốn chạy test case cụ thể, cập nhật `Makefile` để thêm target `testN`.

## 7. Lưu ý cho sinh viên
- Chỉ chỉnh sửa file `main.c`.
- Không thay đổi nội dung trong thư mục `autograder`.
- Đảm bảo chương trình in đúng định dạng `prompt/output` như yêu cầu.

## 8. Mở rộng cho bài tập mới
- Nếu định dạng input/output thay đổi, cập nhật script `runner.sh`.
- Thêm test case mới vào thư mục `data/`.
- Cập nhật `Makefile` nếu cần thiết.
- Sinh viên vẫn chỉ cần chỉnh sửa file `main.c` để giải bài tập.