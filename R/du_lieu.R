# Doc va chuan bi du lieu (tom tat tu cau_a.Rmd), dung cho cau_b.Rmd va cau_c.Rmd.
# DataEA.xls thuc chat la CSV (UTF-8 co BOM), nen doc bang read.csv().

ea_goc <- read.csv(here::here("data", "DataEA.xls"), fileEncoding = "UTF-8-BOM")

bien <- c("MonthlyIncome", "JobLevel",
          "TotalWorkingYears", "YearsAtCompany", "YearsInCurrentRole",
          "JobSatisfaction", "EnvironmentSatisfaction", "WorkLifeBalance", "JobInvolvement")

ea <- ea_goc[, c("EmployeeNumber", "Attrition", "OverTime", bien)]
ea$Attrition <- factor(ea$Attrition, levels = c("No", "Yes"))
ea$OverTime  <- factor(ea$OverTime,  levels = c("No", "Yes"))

# Ma tran du lieu cho MANOVA mot nhan to (9 bien) va hai nhan to (4 bien tam ly - hanh vi)
X <- as.matrix(ea[, bien])
bien_tl <- c("JobSatisfaction", "EnvironmentSatisfaction", "WorkLifeBalance", "JobInvolvement")
Y <- as.matrix(ea[, bien_tl])

nhom <- ea$Attrition
X1 <- X[nhom == "No", ]    # nhan vien dang lam viec
X2 <- X[nhom == "Yes", ]   # nhan vien da nghi viec
n  <- nrow(X); p <- ncol(X); g <- 2
n1 <- nrow(X1); n2 <- nrow(X2)

# 4 o cua mo hinh hai nhan to
o <- interaction(ea$Attrition, ea$OverTime, sep = ".")
