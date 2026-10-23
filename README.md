# MANOVA – Employee Attrition

Bài thực hành Thống kê nhiều chiều, phân tích dữ liệu nhân viên bằng RStudio và R Markdown.

## Sử dụng
1. Mở thư mục dự án trong RStudio.
2. Chạy `source("packages.R")` một lần để cài/kiểm tra thư viện.
3. Mở từng file `notebooks/cau_*.Rmd` và dùng **Run** hoặc **Knit**. Mỗi notebook knit độc lập:
   `R/setup.R` nạp thư viện và hàm dùng chung (`fp()`, `muc_do()`, `B_lan`), `R/du_lieu.R` đọc và
   chuẩn bị dữ liệu (`ea`, `X`, `Y`, `nhom`, ...) theo câu (a).
4. Knit báo cáo chung: mở `Nhom10_report.Rmd` và **Knit**. File này gộp lần lượt `notebooks/cau_a.Rmd` … `cau_g.Rmd`
   (bỏ YAML và chunk `setup` của từng câu), kết quả là `Nhom10_report.html`. Nhãn chunk không được trùng giữa các câu.
5. Đặt `DataEA.xls` vào `data/` trên máy cá nhân sau khi kiểm tra quyền chia sẻ.

**Lưu ý:** Repo GitHub đang Public. File dữ liệu `.xls` được loại khỏi git theo mặc định nhằm tránh vô tình công khai dữ liệu.

## Knit trong VS Code (không cần RStudio)

- Cài extension **R** (`REditorSupport.r`, VS Code sẽ gợi ý khi mở thư mục) để có highlight và chạy từng dòng/chunk.
- Knit bằng task có sẵn trong `.vscode/tasks.json`:
  - `Cmd+Shift+B`: knit `Nhom10_report.Rmd` ra `Nhom10_report.html` rồi mở file.
  - `Cmd+Shift+P` → **Tasks: Run Task** → *Knit file Rmd đang mở*: knit riêng một câu.
- Hoặc gõ trong terminal: `Rscript -e 'rmarkdown::render("Nhom10_report.Rmd")'`.
- Cần `Rscript` và `pandoc` trên PATH (đã có nếu cài R và RStudio / `brew install pandoc`).
