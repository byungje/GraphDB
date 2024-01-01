import base64, json, jwt
import streamlit as st
from PIL import Image
import datetime
import json
from urllib.parse import urlparse
from streamlit_javascript import st_javascript
import base64
from streamlit.components.v1 import html
import base64

# 분석시각화 페이지 테마 / 로고 변경
def streamlit_theme():
    st.sidebar.write("##")

    my_html = f"""<script>
    function prossElementByTestId(testId){{
        var element = window.parent.document.querySelector('[data-testid="'+testId+'"]');
        if (element){{
            console.log(element.textContent);
            element.style.backgroundImage= "url(data:image/png;base64,{base64.b64encode(open('/usr/src/app/image/logo/logo_blue70_none.png', "rb").read()).decode()})";
            element.style.backgroundSize="202.7586206896557px 120px";
            element.style.backgroundPosition="45% 0px";
            element.style.backgroundRepeat="no-repeat";
            var stSidebarNavItems = window.parent.document.querySelector('[data-testid="stSidebarNavItems"]');
            stSidebarNavItems.style.paddingTop = "120px";
            var stSidebarUserContent = window.parent.document.querySelector('[data-testid="stSidebarUserContent"]');
            stSidebarUserContent.style.paddingTop = "188px";
        }} 
        else {{
            var element = window.parent.document.querySelector('[data-testid="stSidebarUserContent"]');
            element.style.backgroundImage= "url(data:image/png;base64,{base64.b64encode(open('/usr/src/app/image/logo/logo_blue70_none.png', "rb").read()).decode()})";
            element.style.backgroundSize="202.7586206896557px 120px";
            element.style.backgroundPosition="45% 0px";
            element.style.backgroundRepeat="no-repeat";
            var stSidebarUserContent = window.parent.document.querySelector('[data-testid="stSidebarUserContent"]');
            stSidebarUserContent.style.paddingTop = "248px";
        }}
    }}
    prossElementByTestId('stSidebarNav');

    </script>"""

    html(my_html)
    st.markdown(f"""
        <style>
        [data-testid="block-container"] {{
                    padding-top:0px;
                    margin-top:-200px;
                }}"""
                ,unsafe_allow_html=True)   
    
    
# 접근권한 페이지
def forbidden_page():
    st.markdown(
        f"""
        <style>
            [data-testid="stSidebarContent"] {{
        background: url(data:image/png;base64,{base64.b64encode(open('/usr/src/app/image/logo/logo_blue70_none.png', "rb").read()).decode()});
        background-size:202.7586206896557px 120px;
        background-position:45% 0px;
        background-repeat:no-repeat;"
            }}
        </style>
        """,
        unsafe_allow_html=True,
    )
    st.experimental_set_query_params(
    status="forbidden",
    )
    col1, col2, col3 = st.columns([1, 7, 2])

    with col1:
        image = Image.open('/usr/src/app/image/forbidden/forbidden_v1.png')
        st.image(image, width=200)
    with col2:
        st.write("# 403 Forbidden \n 페이지를 찾을 수 없습니다. 관리자에게 문의하세요.")
        st.write("E-mail: say5526@gscaltex.com")
        st.link_button("Iceberg Portal", "https://icebergdev.gscaltex.com/?gsc-gate=Y")
    with col3:
        st.write("")
    exit()

# 사용자 접근 기록
def access_log_record(new_log):
    log_file = "/var/log/access_log.json"
    try:
        new_log = new_log
        try:
            with open(log_file, "r") as f:
                history = json.load(f)
        except FileNotFoundError:
            history = {"history": []}

        history["history"].append(new_log)

        with open(log_file, "w") as f:
            json.dump(history, f, indent=4)
        return True
    except Exception as e:
        # print(f"Error: {e}")
        return False

# 사용자 권한 확인 및 접속기록 남김 > 최종 호출할 라이브러리
def check_token_access(menuid):
    
    new_log = {}

    now = datetime.datetime.now()
    access_time = now.strftime('%Y-%m-%d %H:%M:%S')
    new_log["access_time"] = access_time
    new_log["page"] = menuid

    sub_page_list = []
    sub_current_url = st_javascript("await fetch('').then(r => window.parent.location.href)")
    parse_url = urlparse(sub_current_url)
    sub_page = (parse_url.path)[1:]

    if type(sub_page) == bytes:
        pass
    else:
        sub_page_list.append(sub_page)
        new_log["sub_page"] = sub_page_list[0]

    sighKey = "VlwEyVBsYt9V7zq57TejMnVUyzblYcfPQye08f7MGVA9XkHa"
    try:
        current_url = st.experimental_get_query_params()
        token = current_url.get("token")[0]
    except:
        pass

    try:
        if "key" not in st.session_state:
            st.session_state["key"] = token
    except:
        Subject = "None"
        forbidden_page()
        exit()

    claims = None  # claims 변수를 미리 초기화
    token = st.session_state["key"]
    try:
        claims = jwt.decode(token, base64.b64decode(sighKey), algorithms=['HS256'])
        if "menuList" not in claims:
            new_log["token_status"] = "menu 정보가 없는 토큰입니다."    
            raise Exception("menu 정보가 없는 토큰입니다.")
        else:
            new_log["token_status"] = "Valid"
    except jwt.ExpiredSignatureError:
        new_log["token_status"] = ("토큰이 만료되었습니다.")  
    except jwt.InvalidTokenError:
        new_log["token_status"] = ("유효하지 않은 토큰입니다.")   
    except Exception as e:
        new_log["token_status"] = str(e)
        print(str(e))
    
    if claims is not None:
        # 사용자 이름
        Subject = claims["sub"]
        new_log["user"] = Subject
        
        menu_list_json = json.loads(claims['menuList'])

        menu_ids = [item['menuId'] for item in menu_list_json if item.get("menuSe") == "M"] 
        
        if menuid in menu_ids:
            # 접근한 페이지 메뉴 번호
            st.experimental_set_query_params(
                page_no=menuid,
                user=Subject,
                )
            new_log["status"] = "AccessAllowed"
            if "sub_page" not in new_log:
                pass
            else:
                access_log_record(new_log)
            streamlit_theme()    
        else:
            Subject = claims["sub"] or "None"
            new_log["status"] = "AccessDenied"   
            if "sub_page" not in new_log:
                pass
            else:
                access_log_record(new_log)
            forbidden_page()
    else:
        Subject = claims["sub"] or "None"
        new_log["status"] = "AccessDenied"
        if "sub_page" not in new_log:
            pass
        else:
            access_log_record(new_log)
        forbidden_page()