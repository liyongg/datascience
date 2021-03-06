rm(list=ls())
# Updates for every loan in original file
origclass <- c('integer','integer','character', 'integer', 'character', 'real', 'integer', 'character','real','integer','integer','integer','real','character','character','character','character', 'character','character','character','character', 'integer', 'integer','character','character' ,'character')
svcgclass <- c('character','integer','real','character', 'integer','integer','character','character', 'character','integer','real','real','integer', 'integer', 'character','integer','integer', 'integer','integer','integer','integer','real','real')

setwd("~/TUDelft/MDS/Deloitte")

install.packages("stargazer")

library("dplyr")
library("foreign")
library("nnet")
library("stargazer")
library("mlogit")
library("mctest")
library("car")
library("glmnet")
library("caret")
library("dummies")
library("kernlab")


# 2013
origfile_2013 <- read.table("sample_orig_2013.txt", sep="|", header=FALSE, colClasses=origclass )
names(origfile_2013)=c('fico','dt_first_pi','flag_fthb','dt_matr','cd_msa',"mi_pct",'cnt_units','occpy_sts','cltv','dti','orig_upb','ltv','int_rt','channel','ppmt_pnlty','prod_type','st', 'prop_type','zipcode','id_loan','loan_purpose', 'orig_loan_term','cnt_borr','seller_name','servicer_name', 'flag_sc')
svcgfile_2013 <- read.table("sample_svcg_2013.txt", sep="|", header=FALSE )
names(svcgfile_2013)=c('id_loan','svcg_cycle','current_upb','delq_sts','loan_age','mths_remng', 'repch_flag','flag_mod', 'cd_zero_bal', 'dt_zero_bal','current_int_rt','non_int_brng_upb','dt_lst_pi','mi_recoveries', 'net_sale_proceeds','non_mi_recoveries','expenses', 'legal_costs', 'maint_pres_costs','taxes_ins_costs','misc_costs','actual_loss', 'modcost')

# 2014
origfile_2014 <- read.table("sample_orig_2014.txt", sep="|", header=FALSE, colClasses=origclass )
names(origfile_2014)=c('fico','dt_first_pi','flag_fthb','dt_matr','cd_msa',"mi_pct",'cnt_units','occpy_sts','cltv','dti','orig_upb','ltv','int_rt','channel','ppmt_pnlty','prod_type','st', 'prop_type','zipcode','id_loan','loan_purpose', 'orig_loan_term','cnt_borr','seller_name','servicer_name', 'flag_sc')
svcgfile_2014 <- read.table("sample_svcg_2014.txt", sep="|", header=FALSE )
names(svcgfile_2014)=c('id_loan','svcg_cycle','current_upb','delq_sts','loan_age','mths_remng', 'repch_flag','flag_mod', 'cd_zero_bal', 'dt_zero_bal','current_int_rt','non_int_brng_upb','dt_lst_pi','mi_recoveries', 'net_sale_proceeds','non_mi_recoveries','expenses', 'legal_costs', 'maint_pres_costs','taxes_ins_costs','misc_costs','actual_loss', 'modcost')

# 2015
origfile_2015 <- read.table("sample_orig_2015.txt", sep="|", header=FALSE, colClasses=origclass )
names(origfile_2015)=c('fico','dt_first_pi','flag_fthb','dt_matr','cd_msa',"mi_pct",'cnt_units','occpy_sts','cltv','dti','orig_upb','ltv','int_rt','channel','ppmt_pnlty','prod_type','st', 'prop_type','zipcode','id_loan','loan_purpose', 'orig_loan_term','cnt_borr','seller_name','servicer_name', 'flag_sc')
svcgfile_2015 <- read.table("sample_svcg_2015.txt", sep="|", header=FALSE )
names(svcgfile_2015)=c('id_loan','svcg_cycle','current_upb','delq_sts','loan_age','mths_remng', 'repch_flag','flag_mod', 'cd_zero_bal', 'dt_zero_bal','current_int_rt','non_int_brng_upb','dt_lst_pi','mi_recoveries', 'net_sale_proceeds','non_mi_recoveries','expenses', 'legal_costs', 'maint_pres_costs','taxes_ins_costs','misc_costs','actual_loss', 'modcost')

# 2016
origfile_2016 <- read.table("sample_orig_2016.txt", sep="|", header=FALSE, colClasses=origclass )
names(origfile_2016)=c('fico','dt_first_pi','flag_fthb','dt_matr','cd_msa',"mi_pct",'cnt_units','occpy_sts','cltv','dti','orig_upb','ltv','int_rt','channel','ppmt_pnlty','prod_type','st', 'prop_type','zipcode','id_loan','loan_purpose', 'orig_loan_term','cnt_borr','seller_name','servicer_name', 'flag_sc')
svcgfile_2016 <- read.table("sample_svcg_2016.txt", sep="|", header=FALSE )
names(svcgfile_2016)=c('id_loan','svcg_cycle','current_upb','delq_sts','loan_age','mths_remng', 'repch_flag','flag_mod', 'cd_zero_bal', 'dt_zero_bal','current_int_rt','non_int_brng_upb','dt_lst_pi','mi_recoveries', 'net_sale_proceeds','non_mi_recoveries','expenses', 'legal_costs', 'maint_pres_costs','taxes_ins_costs','misc_costs','actual_loss', 'modcost')

# 2017
origfile_2017 <- read.table("sample_orig_2017.txt", sep="|", header=FALSE, colClasses=origclass )
names(origfile_2017)=c('fico','dt_first_pi','flag_fthb','dt_matr','cd_msa',"mi_pct",'cnt_units','occpy_sts','cltv','dti','orig_upb','ltv','int_rt','channel','ppmt_pnlty','prod_type','st', 'prop_type','zipcode','id_loan','loan_purpose', 'orig_loan_term','cnt_borr','seller_name','servicer_name', 'flag_sc')
svcgfile_2017 <- read.table("sample_svcg_2017.txt", sep="|", header=FALSE )
names(svcgfile_2017)=c('id_loan','svcg_cycle','current_upb','delq_sts','loan_age','mths_remng', 'repch_flag','flag_mod', 'cd_zero_bal', 'dt_zero_bal','current_int_rt','non_int_brng_upb','dt_lst_pi','mi_recoveries', 'net_sale_proceeds','non_mi_recoveries','expenses', 'legal_costs', 'maint_pres_costs','taxes_ins_costs','misc_costs','actual_loss', 'modcost')

origfile <- rbind(origfile_2013,origfile_2014,origfile_2015,origfile_2016,origfile_2017)
svcgfile <- rbind(svcgfile_2013,svcgfile_2014,svcgfile_2015,svcgfile_2016,svcgfile_2017)

merge_data_0917 = merge(origfile, svcgfile, by = "id_loan", all.y = TRUE)

drops <- c("repch_flag","flag_mod", "dt_lst_pi", "net_sale_proceeds", "non_mi_recoveries", "expenses",
           "legal_costs", "maint_pres_costs", "taxes_ins_costs", "misc_costs", "actual_loss", 
           "modcost","step_mod_flag", "def_pay_mod", "ELTV")
drop <- c("cd_zero_bal","dt_zero_bal","cd_msa","NA.1","NA.2","","ppmt_pnlty","prod_type","st","zipcode",
          "seller_name","servicer_name","mi_recoveries","flag_sc","flag_fthb")
merge_data_0917 = merge_data_0917[ , !(names(merge_data_0917) %in% drop)]
merge_data_0917 = merge_data_0917[ , !(names(merge_data_0917) %in% drops)]
merge_data_0917 = merge_data_0917[merge_data_0917$prop_type != "", ]
merge_data_0917 = merge_data_0917[merge_data_0917$dti != 999, ]
merge_data_0917 = merge_data_0917[merge_data_0917$ltv != 999, ]
merge_data_0917 = merge_data_0917[merge_data_0917$fico != 9999, ]


#rm(origfile,origfile_2013,origfile_2014,origfile_2015,origfile_2016,origfile_2017,svcgfile,svcgfile_2013,svcgfile_2014,svcgfile_2015,svcgfile_2016,svcgfile_2017)


### CREATE VARIABLES ###
## Amortization
# create a column for amortization
merge_data_0917 = merge_data_0917 %>%
  group_by(id_loan) %>%
  mutate(amort = lag(current_upb, default = current_upb[1]) - current_upb)

# create a column for total interest paid
merge_data_0917$int_paid = merge_data_0917$amort*merge_data_0917$current_int_rt/100

# create a column for total actual payment
merge_data_0917$tt_pment = merge_data_0917$amort + merge_data_0917$int_paid

# create a column for expected payment
merge_data_0917$exp_pment = ifelse(merge_data_0917$current_int_rt == 0, 
                                   (merge_data_0917$current_upb + merge_data_0917$amort)/
                                     (merge_data_0917$orig_loan_term - merge_data_0917$loan_age),
                                   (merge_data_0917$current_upb + merge_data_0917$amort)*
                                     (merge_data_0917$current_int_rt/1200)/
                                     ((1+(merge_data_0917$current_int_rt/1200))**
                                        (merge_data_0917$orig_loan_term -merge_data_0917$loan_age)-1))
# create a column for prepayment percentage
merge_data_0917$ppmt_percent = ifelse(merge_data_0917$exp_pment == 0, 0, 
                                      round((merge_data_0917$tt_pment - merge_data_0917$exp_pment)/
                                              merge_data_0917$exp_pment,4))

b = rle(merge_data_0917$ppmt_percent)
c = which(b$values == -1.000)
d = cumsum(b$lengths)
e = d[c]+1
f = b$lengths[c]
merge_data_0917[e, "ppmt_percent"] = merge_data_0917[e, "ppmt_percent"] - f

# ratio of prepayment to full original upb
merge_data_0917$ppmt_ratio = round(merge_data_0917$amort/merge_data_0917$orig_upb, 3)
merge_data_0917$ppmt_ratio[merge_data_0917$ppmt_ratio < 0] = 0

#ratio of prepayment to full current upb
merge_data_0917$ppmt_rel_ratio = round(merge_data_0917$exp_pment/
                                        (merge_data_0917$current_upb + merge_data_0917$exp_pment), 3)
merge_data_0917$ppmt_rel_ratio[merge_data_0917$ppmt_rel_ratio < 0] = 0

#previous amortization amount
merge_data_0917$prev_amort = 0
merge_data_0917 = merge_data_0917 %>%
  group_by(id_loan) %>%
  mutate(prev_amort = lag(amort, default = amort[1]))

#sum of previous prepayments in relative amount over the loan age
merge_data_0917$prev_ppmt_cont = 0
merge_data_0917 = merge_data_0917 %>%
  group_by(id_loan) %>%
  mutate(prev_ppmt_cont = lag(prev_ppmt_cont, default = prev_ppmt_cont[1]) + ppmt_percent/loan_age)
merge_data_0917$prev_prev_ppmt_cont = merge_data_0917$prev_ppmt_cont -
  merge_data_0917$ppmt_percent/merge_data_0917$loan_age


## Prepayment indicator (4 categories: No, Low, Medium, High)
# 0 for no prepayment (monthly expected payment exceed monthly actual payment by less than 10%)
# 1 for low prepayment (ratio monthly expected payment to total principle amount is less than 0.2)
# 2 for medium prepayment (ratio monthly expected payment to total principle amount is between 0.1 to 0.8)
# 3 for high prepayment (ratio monthly expected payment to total principle amount is more than 0.8)
merge_data_0917$ppmt_ind_NLMH = ifelse(merge_data_0917$ppmt_percent > 0.1, 1, 0)
merge_data_0917$ppmt_ind_NLMH[merge_data_0917$ppmt_ind_NLMH ==1 & merge_data_0917$ppmt_ratio > 0.2] = 2
merge_data_0917$ppmt_ind_NLMH[merge_data_0917$ppmt_ind_NLMH ==2 & 
                                 merge_data_0917$ppmt_ratio >=0.8] = 3

## Prepayment indicator (3 categories)
# 0 for no prepayment, 1 for partial prepayment, 2 for full prepayment
# full prepayment is determined by zero balance code "01"
merge_data_0917$ppmt_ind_3 = ifelse(merge_data_0917$ppmt_percent > 0.1, 1, 0)
merge_data_0917$ppmt_ind_3[merge_data_0917$ppmt_ind_3 == 1 & merge_data_0917$ppmt_ratio >= 0.1] = 2


## Prepayment indicator (2 categories)
# 0 for no prepayment, 1 for prepayment
# prepayment is determined if actual payment is more than 10% of expected payment
merge_data_0917$ppmt_ind_2 = ifelse(merge_data_0917$ppmt_percent > 0.1, 1, 0)



# create a column for the current scaled sum of previous prepayments
merge_data_0917$sum_ppmt_scaled = 0
merge_data_0917 = merge_data_0917 %>%
  group_by(id_loan) %>%
  mutate(sum_ppmt_scaled = lag(sum_ppmt_scaled, default = sum_ppmt_scaled[1]) + (ppmt_ind_NLMH)^4/(loan_age+1))

# create a column for previous scaled sum of previous prepayments
merge_data_0917$prev_ppmt_scaled = merge_data_0917$sum_ppmt_scaled - 
  (merge_data_0917$ppmt_ind_NLMH)^4/(merge_data_0917$loan_age + 1)

# create a column for the current scaled sum of previous prepayments for binomial
merge_data_0917$sum_ppmt_scaled_2 = 0
merge_data_0917 = merge_data_0917 %>%
  group_by(id_loan) %>%
  mutate(sum_ppmt_scaled_2 = lag(sum_ppmt_scaled_2, default = sum_ppmt_scaled_2[1]) + (ppmt_ind_2)/(loan_age+1))

# create a column for previous scaled sum of previous prepayments
merge_data_0917$prev_ppmt_scaled_2 = merge_data_0917$sum_ppmt_scaled_2 - 
  (merge_data_0917$ppmt_ind_2)/(merge_data_0917$loan_age + 1)

# create a column for the current scaled sum of previous prepayments for trinomial
merge_data_0917$sum_ppmt_scaled_3 = 0
merge_data_0917 = merge_data_0917 %>%
  group_by(id_loan) %>%
  mutate(sum_ppmt_scaled_3 = lag(sum_ppmt_scaled_3, default = sum_ppmt_scaled_3[1]) + (ppmt_ind_3)^4/(loan_age+1))

# create a column for previous scaled sum of previous prepayments
merge_data_0917$prev_ppmt_scaled_3 = merge_data_0917$sum_ppmt_scaled_3 - 
  (merge_data_0917$ppmt_ind_3)^4/(merge_data_0917$loan_age + 1)


## Relative time 
merge_data_0917$rel_time = merge_data_0917$mths_remng / merge_data_0917$orig_loan_term

## Seasonality
# extract the month of the payment
merge_data_0917$month = substr(merge_data_0917$svcg_cycle, 5, 6)
merge_data_0917$month = as.factor(merge_data_0917$month)
merge_data_0917$seasonality = ifelse(merge_data_0917$month %in% c("09","10","11","12"), 1, 0)
merge_data_0917$seasonality = as.factor(merge_data_0917$seasonality)

# extract the year of the payment
merge_data_0917$year = substr(merge_data_0917$svcg_cycle, 1, 4)

## No. of units
merge_data_0917$cnt_units = as.factor(merge_data_0917$cnt_units)

## External factors
# Divorce rates
divorce_rate = read.csv("divorce_rates.csv", header = TRUE)
colnames(divorce_rate) = c("year", "divorce_rate")
divorce_rate$year = as.factor(divorce_rate$year)
merge_data_0917 = merge(merge_data_0917, divorce_rate, by = "year", all.x = TRUE, all.y = FALSE)
rm(divorce_rate)

# Market rates
mkt_rate = read.csv("market_rates.csv", header = TRUE)
mkt_rate$X15.year.mortgage = NULL
colnames(mkt_rate) = c("year", "month", "mkt_rate")
mkt_rate$month <- sprintf("%02d", as.numeric(mkt_rate$month))
mkt_rate$year = as.factor(mkt_rate$year)
mkt_rate$month = as.factor(mkt_rate$month)
merge_data_0917 = merge(merge_data_0917, mkt_rate, by = c("year", "month"), all.x = TRUE, all.y = FALSE)
merge_data_0917$delta_rt = (merge_data_0917$mkt_rate - 
                              merge_data_0917$current_int_rt)/merge_data_0917$current_int_rt
rm(mkt_rate)

# LIBOR rate
libor = read.csv("LIBOR.csv", header = TRUE)
colnames(libor) = c("year", "month", "libor")
libor$month <- sprintf("%02d", as.numeric(libor$month))
libor$year = as.factor(libor$year)
libor$month = as.factor(libor$month)
merge_data_0917 = merge(merge_data_0917, libor, by = c("year", "month"), all.x = TRUE, all.y = FALSE)
rm(libor)

merge_data_0917 = merge_data_0917[merge_data_0917$year %in% c("2013","2014","2015", "2016","2017"),]


### CREATE NEW DATAFRAME ###
RemoveDups <- function(df, column) {
  inds = sample(1:nrow(df))  
  df   = df[inds, ]
  dups = duplicated(df[, column])
  df   = df[!dups, ]
  inds = inds[!dups]
  df[sort(inds, index=T)$ix, ]
}
df = data.frame(matrix(vector(), 0, ncol(merge_data_0917),
                       dimnames=list(c(), colnames(merge_data_0917))))
for (i in unique(merge_data_0917$year))
{
  temp = merge_data_0917[merge_data_0917$year == i,]
  temp = RemoveDups(temp, "id_loan")
  df = rbind.data.frame(df, temp)
}
rm(temp)

df$ppmt_ind_3 = as.factor(df$ppmt_ind_3)
df$ppmt_ind_3 = relevel(df$ppmt_ind_3, ref = "0")
df$ppmt_ind_NLMH = as.factor(df$ppmt_ind_NLMH)
#df$ppmt_ind_NLMH = relevel(df$ppmt_ind_NLHM, ref = "0")

# create train and test data
train <- df[df$year %in% c("2013","2014","2015","2016"),]
test <- df[df$year %in% c("2017"),]

## NLMH model
# use multinom function to produce mnl model 
NLMH_mnl = multinom(ppmt_ind_NLMH ~ fico + mi_pct + dti + delta_rt + ltv + rel_time + orig_upb + prev_amort +
                      libor + divorce_rate + factor(cnt_units) + factor(occpy_sts) + factor(channel) + 
                      prev_ppmt_scaled + factor(prop_type) + factor(loan_purpose) + factor(seasonality), 
                    data=train, maxit = 500)
#NLMH_mnl_summary = summary(NLMH_mnl)
NLMH_mnl_rrr = exp(coef(NLMH_mnl))
stargazer(NLMH_mnl, type="latex", coef=list(NLMH_mnl_rrr), p.auto=FALSE, out="NLMHrrr.latex")
train$ppmt_NLMH_predicted = predict(NLMH_mnl, newdata = train, "class")
train_tab_NLMH = table(train$ppmt_ind_NLMH, train$ppmt_NLMH_predicted)
test$ppmt_NLMH_predicted = predict(NLMH_mnl, newdata = test, "class")
test_tab_NLMH = table(test$ppmt_ind_NLMH, test$ppmt_NLMH_predicted)
df$ppmt_NLMH_predicted = predict(NLMH_mnl, newdata = df, "class")
total_tab_NLMH = table(df$ppmt_ind_NLMH, df$ppmt_NLMH_predicted)
train_tab_NLMH
test_tab_NLMH
total_tab_NLMH

## trinary model
# use multinom function to produce mnl model 
trinomial_mnl = multinom(ppmt_ind_3 ~ fico + mi_pct + dti + delta_rt + ltv + rel_time + orig_upb + prev_amort +
                           libor + divorce_rate + factor(cnt_units) + factor(occpy_sts) + factor(channel) + 
                           prev_ppmt_scaled_3 + factor(prop_type) + factor(loan_purpose) + factor(seasonality), 
                         data=train, maxit = 500)
#trinomial_mnl_summary = summary(trinomial_mnl)
trinomial_mnl_rrr = exp(coef(trinomial_mnl))
stargazer(trinomial_mnl, type="latex", coef=list(trinomial_mnl_rrr), p.auto=FALSE, out="trinomialrrr.latex")
train$ppmt_3_predicted = predict(trinomial_mnl, newdata = train, "class")
train_tab_trinomial = table(train$ppmt_ind_3, train$ppmt_3_predicted)
test$ppmt_3_predicted = predict(trinomial_mnl, newdata = test, "class")
test_tab_trinomial = table(test$ppmt_ind_3, test$ppmt_3_predicted)
df$ppmt_3_predicted = predict(trinomial_mnl, newdata = df, "class")
total_tab_trinomial = table(df$ppmt_ind_3, df$ppmt_3_predicted)
train_tab_trinomial
test_tab_trinomial
total_tab_trinomial

## binary model
# use glm function to produce mnl model and remove variables with low p-value
# use vif to test for collinearity
binomial_mnl = multinom(ppmt_ind_2 ~ fico + mi_pct + dti + delta_rt + ltv + rel_time + orig_upb + prev_amort +
                          libor + divorce_rate + factor(cnt_units) + factor(occpy_sts) + factor(channel) + current_int_rt +
                          prev_ppmt_scaled_2 + factor(prop_type) + factor(loan_purpose) + factor(seasonality), 
                        data=train, maxit = 500)
#binomial_mnl_summary = summary(binomial_mnl)
#binomial_mnl_vif = vif(binomial_mnl)
#binomial_mnl_rrr = exp(coef(binomial_mnl))
#stargazer(binomial_mnl, type="latex", coef=list(binomial_mnl_rrr), p.auto=FALSE, out="binomialrrr.latex")
train$ppmt_2_predicted = predict(binomial_mnl, newdata = train, "class")
train_tab_binomial = table(train$ppmt_ind_2, train$ppmt_2_predicted)
test$ppmt_2_predicted = predict(binomial_mnl, newdata = test, "class")
test_tab_binomial = table(test$ppmt_ind_2, test$ppmt_2_predicted)
df$ppmt_2_predicted = predict(binomial_mnl, newdata = df, "class")
total_tab_binomial = table(df$ppmt_ind_2, df$ppmt_2_predicted)
train_tab_binomial
test_tab_binomial
total_tab_binomial
