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

# Nhan de doc: Attrition No = Working (dang lam), Yes = Left (da nghi viec);
# OverTime No = NoOT (khong lam them gio), Yes = OT (co lam them gio)
nhan_attrition <- c(No = "Working", Yes = "Left")
nhan_overtime  <- c(No = "NoOT", Yes = "OT")
nhom_nhan <- factor(nhan_attrition[as.character(nhom)], levels = c("Working", "Left"))

# 4 o cua mo hinh hai nhan to: Working-NoOT, Left-NoOT, Working-OT, Left-OT
o <- factor(paste(nhan_attrition[as.character(ea$Attrition)], nhan_overtime[as.character(ea$OverTime)], sep = "-"),
            levels = c("Working-NoOT", "Left-NoOT", "Working-OT", "Left-OT"))

# Kich ban 2 cua MANOVA mot nhan to (cau b): bo MonthlyIncome do da cong tuyen voi JobLevel
bien_kb2 <- setdiff(bien, "MonthlyIncome")
X_kb2 <- X[, bien_kb2]
