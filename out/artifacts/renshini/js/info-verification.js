function success(id) {
    $('#'+id+' img').attr('src','../img/verifycode_success.png');
    $('#'+id+'Desc').html('');
}
function failure(id, msg) {
    $('#'+id+' img').attr('src','../img/verifycode_valid.png');
    $('#'+id+'Desc').html(msg);
}

/* 验证注册姓名的填写（这里只实现了长度必须小于6位） */
$("input[name='name']").blur(function(){
    var nameContent = $(this).val();
    if(nameContent == ""){
        failure('nameError', '用户名不能为空');
    }else{
        if(nameContent.length > 6){
            failure('nameError', '用户名长度不能超过6位');
        }else{
            success('nameError');
        }
    }
});

/* 判断两次输入的密码是否一致 */
$('#pwd1').blur(function(){
    if($(this).val() == $('#pwd').val()){
        success('pwdError');
    }else{
        failure('pwdError', '两次密码填写不一样');
    }
});

/* 判断输入的手机号格式是否正确 */
$('#tele').blur(function(){
    var teleContent = $(this).val();
    if(teleContent == ''){
        failure('teleError', '手机号不能为空');
    }else{
        if(teleContent.match('^1[3|4|5|8][0-9]\\d{8}$')){
            success('teleError');
        }else{
            failure('teleError', '请输入正确的手机号');
        }
    }
});

/* 点击得到校验码（这里使用弹出框的方式提示） */
function getCode(){
    var valueTele = $('#tele').val();
    var url = "${pageContext.request.contextPath }/user_getSMSCode.action";
    var param = {'tele' : valueTele};
    $.post(url,param,function(data){
        alert(data);
    },"json");
}

/* 	1、前端当验证码失去焦点时触发一函数
    2、发送ajax调用后台方法进行验证
    3、返回验证后的信息（正确或是错误）
    4、正确的话在对应行后面显示一个小勾图片（verifycode_success）；不正确的话显示一个警告图片（verifycode_valid）后面再显示错误的信息提示（如：输入的短信验证码不正确）
    注：这个错误正确的提示信息 可以应用在每个地方*/
/*$('#code').blur(function(){
    var valueCode = $('#code').val();
    var url = "${pageContext.request.contextPath }/user_verificationSMS.action";
    var param = {'vcode' : valueCode};
    $.post(url,param,function(data){
      if(data == "验证码输入正确"){
          success('codeError');
      }else{
          failure('codeError', '输出的验证码不正确');
      }
    },"text");//返回的中文需要使用text，可以直接输出，json不行
});*/

/* 注册页面（当信息填写完全时允许提交，否则提示“请填写完整信息”） */
$('#submit').mouseover(function () {    //鼠标移入时进行判断信息填写是否完整
    var nameInfo = $('#nameError img').attr('src');
    var pwdInfo = $('#pwdError img').attr('src');
    var teleInfo = $('#teleError img').attr('src');
    var info = "../img/verifycode_success.png";
    var submit = "input[type='submit']";
    if(nameInfo == info && pwdInfo == info && teleInfo == info){//填写完整，可以提交表单（双击的提示信息拿了）
        $(submit).removeAttr('onclick');
        $(submit).removeAttr('ondblclick');
    }else{//反之，是否已经禁止，没有添加禁止（还有加上信息提示）
        if(($(submit).attr('onclick') != "return false;")){
            $(submit).attr('onclick', 'return false;');
            $(submit).attr('ondblclick', 'errorTip();');
        }
    }
});
function errorTip() {
    alert('请输入完整信息！');
}