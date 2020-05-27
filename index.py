#-*- coding: UTF-8 -*-

# 主程式
# SESSION 插件
import os
import json
# MVC 插件
from flask import Flask, render_template ,redirect,request,url_for,session,Response

# 其他頁面插件
# import admin_cur as ac #管理插件
import data as dt      #資料插件

# 建立 MVC 及 SESSION KEY
app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv('SECRET_KEY') or \
    'e5ac333c-f0bf-11e5-9e39-d3b532c10a28'

# 設定全域變數(媽的老是跳錯)
val = {}
# HAMYS = {}
# Age = {}
# Aum = {}
# Lum = {}
# Compo = {}

# 主首頁
@app.route("/")
def index():
    tags_f=dt.tags_f_list()
    tags_list=dt.tags_list()
    total=dt.total("")

    col_type=getval((dt.tags_col_type(tags_list)).split(","),2)

    # 設定全域變數
    # global HAMYS , Age , Aum , Lum , Compo
    # global  Age , Aum , Lum , Compo
    # HAMYS = {}
    # Age = {}
    # Aum = {}
    # Lum = {}
    # Compo = {}

    # HAMYS = getval(total['HAMYS_count'],1)
    HAMYS = getval(total['HAMYS_count'].split(","),2)

    # for i in range(len(total['HAMYS_count'])):
    #     HAMYS[total['HAMYS_count'][i][0].split(":")[0]] = total['HAMYS_count'][i][0].split(":")[1]

    # Age_all = total['Age_count'].split(",")

    # for i in range(len(Age_all)):
    #     Age[Age_all[i].split(":")[0]] = Age_all[i].split(":")[1]

    Age = getval(total['Age_count'].split(","),2)

    # Aum_all = total['Aum_count'].split(",")

    # for i in range(len(Aum_all)):
    #     Aum[Aum_all[i].split(":")[0]] = Aum_all[i].split(":")[1]

    Aum = getval(total['Aum_count'].split(","),2)

    # Lum_all = total['Lum_count'].split(",")

    # for i in range(len(Lum_all)):
    #     Lum[Lum_all[i].split(":")[0]] = Lum_all[i].split(":")[1]

    Lum = getval(total['Lum_count'].split(","),2)

    # Compo_all = total['Compo_count'].split(",")

    # for i in range(len(Compo_all)):
    #     Compo[Compo_all[i].split(":")[0]] = Compo_all[i].split(":")[1]

    Compo = getval(total['Compo_count'].split(","),2)

    #將第一次算完的全行客戶基準
    #於session塞八個dictionary物件 用於八張圖表的呈現
    #if session.get() == True  => 記得加入session是否已存在物件 避免過度每進首頁都撈DB
    # session['total'] = format(total['total_count'],',')
    session['total'] = total['total_count']
    # session['totalHAMYS'] = {'H':100,'A':200,'M':150,'Y':123,'S':93}
    session['totalHAMYS'] = {'H':HAMYS['H'],'A':HAMYS['A'],'M':HAMYS['M'],'Y':HAMYS['Y']}
    # session['totalAge'] = {'20':200,'35':300,'50':500,'60':300,'70':123,'80':70,'120':40}
    session['totalAge'] = {'19':Age['AGE_CNT_19'],'29':Age['AGE_CNT_20_29'],'39':Age['AGE_CNT_30_39'],'49':Age['AGE_CNT_40_49'],'59':Age['AGE_CNT_50_59'],'69':Age['AGE_CNT_60_69'],'79':Age['AGE_CNT_70_79'],'80':Age['AGE_CNT_80']}
    # session['totalAum'] = {'twd':20,'fx':35,'invest':15,'insure':30}
    session['totalAum'] = {'AUM_PO_AMT':Aum['AUM_PO_AMT'],'AUM_SAVE_AMT':Aum['AUM_SAVE_AMT'],'AUM_INVEST_AMT':Aum['AUM_INVEST_AMT']}
    # session['totalLum'] = {'credit':37,'mortgage':63}
    session['totalLum'] = {'LN01_M0_AMT':Lum['LN01_M0_AMT'],'LN02_M0_AMT':Lum['LN02_M0_AMT']}
    # session['totalCompo'] = {'CC_FLG':40,'EB_MB_ACTIVE':60,'HA':40,'BRANCH':94,'SALARY_FLG':50,'SEC_ACCT_FLG':40,'STOCK_INT_2Y_FLG':43,'OTHBANK_HIGHT':34,'OTHBANK_TOP':60}
    session['totalCompo'] = {'CC_FLG':Compo['CC_FLG'],'EB_MB_ACTIVE':Compo['EB_MB_ACTIVE'],'HA':Compo['HA'],'BRANCH':Compo['BRANCH'],'SALARY_FLG':Compo['SALARY_FLG'],'SEC_ACCT_FLG':Compo['SEC_ACCT_FLG'],'STOCK_INT_2Y_FLG':Compo['STOCK_INT_2Y_FLG'],'OTHBANK_HIGHT':Compo['OTHBANK_HIGHT'],'OTHBANK_TOP':Compo['OTHBANK_TOP']}
    return render_template("index.html",tags_f=tags_f,tags_list=tags_list,col_type=col_type,test="ttt")

# 取得目標客戶  這是讓user打ajax過來取資料的API
@app.route("/targetCust" , methods=["POST"])
def targetCust():
    target=dt.total(request.form['data'])

    percent = target['total_count'] / session['total'] * 100

    HAMYS = getval(target['HAMYS_count'].split(","),2)
    Age = getval(target['Age_count'].split(","),2)
    Aum = getval(target['Aum_count'].split(","),2)
    Lum = getval(target['Lum_count'].split(","),2)
    Compo = getval(target['Compo_count'].split(","),2)

    # session['test']=HAMYS["'H'"]

    #以下請於targetCust塞八個dictionary物件 用於八張圖表的總目標客戶
    targetCust = {
    # target_total
    'target_total':{'number':format(target['total_count'],','),'percent':percent},
    # 'HAMYS':{'H':40,'A':100,'M':75,'Y':90,'S':70},
    # 'HAMYS':{'H':40,'A':100,'M':75,'Y':90},
    'HAMYS':{'H':HAMYS['H'],'A':HAMYS['A'],'M':HAMYS['M'],'Y':HAMYS['Y']},
    # 'HAMYS':{'H':HAMYS["'H'"],'A':HAMYS["'A'"],'M':HAMYS["'M'"],'Y':HAMYS["'Y'"]},
    # 'age':{'20':60,'35':100,'50':130,'60':150,'70':100,'80':30,'120':20},
    # 'age':{'19':60,'29':100,'39':130,'49':150,'59':100,'69':30,'79':20,'80':22},
    'age':{'19':Age['AGE_CNT_19'],'29':Age['AGE_CNT_20_29'],'39':Age['AGE_CNT_30_39'],'49':Age['AGE_CNT_40_49'],'59':Age['AGE_CNT_50_59'],'69':Age['AGE_CNT_60_69'],'79':Age['AGE_CNT_70_79'],'80':Age['AGE_CNT_80']},
    # 'aum':{'twd':10,'fx':40,'invest':35,'insure':15},
    # 'aum':{'AUM_PO_AMT':9999999,'AUM_SAVE_AMT':888888,'AUM_INVEST_AMT':77777777},
    'aum':{'AUM_PO_AMT':Aum['AUM_PO_AMT'],'AUM_SAVE_AMT':Aum['AUM_SAVE_AMT'],'AUM_INVEST_AMT':Aum['AUM_INVEST_AMT']},
    # 'lum':{'credit':50,'mortgage':50},
    # 'lum':{'LN01_M0_AMT':500000,'LN02_M0_AMT':5066666},
    'lum':{'LN01_M0_AMT':Lum['LN01_M0_AMT'],'LN02_M0_AMT':Lum['LN02_M0_AMT']},
    # 'compo':{'CC_FLG':20,'EB_MB_ACTIVE':30,'HA':12,'BRANCH':34,'SALARY_FLG':10,'SEC_ACCT_FLG':20,'STOCK_INT_2Y_FLG':10,'OTHBANK_HIGHT':15,'OTHBANK_TOP':20}
    'compo':{'CC_FLG':Compo['CC_FLG'],'EB_MB_ACTIVE':Compo['EB_MB_ACTIVE'],'HA':Compo['HA'],'BRANCH':Compo['BRANCH'],'SALARY_FLG':Compo['SALARY_FLG'],'SEC_ACCT_FLG':Compo['SEC_ACCT_FLG'],'STOCK_INT_2Y_FLG':Compo['STOCK_INT_2Y_FLG'],'OTHBANK_HIGHT':Compo['OTHBANK_HIGHT'],'OTHBANK_TOP':Compo['OTHBANK_TOP']}
    }
    return Response(json.dumps(targetCust), mimetype='application/json')

# 登入程式
@app.route("/login_post" , methods=["POST"])
def login_post():
	if request.form.get("act") != "" and request.form.get("pwd") != "":
		act = request.form.get("act")
		pwd = request.form.get("pwd")
		return redirect(url_for("index"))
	else:
		return redirect(url_for("login"))

# 登入程式
@app.route("/login")
def login():
	return render_template("login.html")

# 忘記密碼
@app.route("/forgot_password")
def forgot_password():
	return render_template("forgot-password.html")

# 登出，並清除 SESSION
@app.route("/logout")
def logout():
	session['loaddone'] = False
	session.pop('act', None)
	session.pop('name', None)
	return redirect(url_for("login"))

# 刪除搜尋的 SESSION
def killtr():
    session.pop('target_total',None)

# 整理各值
def getval(obj,mt):
    val = {}
    if mt == 1:
        for i in range(len(obj)):
            val[obj[i][0].split(":")[0]] = obj[i][0].split(":")[1]

    elif mt == 2:
        for i in range(len(obj)):
            val[obj[i].split(":")[0]] = obj[i].split(":")[1]

    else:
        val = {}

    return val

# 執行頁面
if __name__ == "__main__":
	app.run(debug=True)
	# app.run(port=3333)
	# app.run(host='0.0.0.0',port=80)
	# app.run(host='0.0.0.0',port=3333)
