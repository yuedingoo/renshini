<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>认识你-个人主页</title>

	<!-- Bootstrap -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/mainpage.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css"  >
	<script src="../js/bootstrap-datetimepicker.js"></script>
</head>
<body>
<div class="second-head">
	<div class="second-head-img ">
		<div class="second-head-img-head">
			<img src="../img/31be1dd7cc2d4631aa1d99edfb26b080.jpg" alt="个人图片" class="img-circle" width="150" >
		</div>
		<div class="second-head-img-name">
		<span>张九波</span>
		</div>
		<div class="second-head-img-name">
			<span>男</span> <span>1996-9-26</span> <span>软件开发</span>
		</div>
		<div class="second-head-img-name">
			<span>个性签名:hahahhahhaahahha</span><span><a>更多信息</a></span><span><a>修改信息</a></span>
		</div>
		<div style="display: none" class="second-head-img-content" >
		<div class="name">
			<span>姓名:<input type="text"></span>
			<span>性别:<select>
									<option value="男">男</option>
									<option value="女">女</option>
								</select>
					</span>
			<span>生日:
				<input type="text" value="2017-1-29">
			</span>
		</div>
		<div class="job">
			<span>职业:<input type="text" value="软件开发">
				</span>
		</div>

		<div class="note">
				<span>个性签名:<input type="text" value="hahahahhahhhhhhahahahahahahhahahaahh"></span>
		</div>

		<div class="star">
		<span>星座:<select>
							<option value="双子座">双子座</option>
							<option value="仙女座">仙女座</option>
					</select>
		</span>
		<span>血型:<select>
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="AB">AB</option>
						<option value="O">O</option>
					</select>
		</span>
		<span>生活状态:<select>
					<option value="married">已婚</option>
					<option value="unmarried">未婚</option>
						</select>
		</span>
		<span>爱好:
		</span>
		<div class="radio-hobby">
			<div><input type="radio">电影<input type="radio">电影<input type="radio">电影<input type="radio">电影</div>
			<div><input type="radio">电影<input type="radio">电影<input type="radio">电影<input type="radio">电影</div>
			<div><input type="radio">电影<input type="radio">电影<input type="radio">电影<input type="radio">电影</div>
			<div><input type="radio">电影<input type="radio">电影<input type="radio">电影<input type="radio">电影</div>
		</div>
		<div class="live">
		<span>现居地:<select>
				<option>中国</option>
				<option>外国</option>
		</select>
		<select>
				<option>江西</option>
				<option>湖南</option>
		</select>
		<select>
				<option>赣州</option>
				<option>抚州</option>
		</select>
		</span>
		</div>
		<div class="home">
			<span>家乡:<select>
					<option>中国</option>
					<option>外国</option>
			</select>
			<select>
					<option>江西</option>
					<option>湖南</option>
			</select>
			<select>
					<option>赣州</option>
					<option>抚州</option>
			</select>
			</span>
		</div>
		<div class="company">
			<span>公司:<input type="text">
			<span>公司地址:<select>
					<option>江西</option>
					<option>湖南</option>
							</select>
							<select>
					<option>赣州</option>
					<option>抚州</option>
							</select>
				<select>
					<option>红旗大道86号</option>
					<option>抚州</option>
				</select>
			</span>

			</span>
		</div>
		</div>


	</div>
		<div class="second-head-img-personal">
			<div class="second-head-img-data">
				<span>个人资料库</span>
			</div>
			<div class="second-head-img-shuoshuo">
				<span>我的说说</span>
			</div>
			<textarea rows="5" cols="50" ></textarea>
			<div class="second-head-img-submit">
				<span><a>发表</a></span>
			</div>

			<div class="second-head-img-shuoshuolist" >
				<div class="second-head-img-punished">
					<span>
						发布过的说说
					</span>
				</div>
				<div class="second-head-img-shuoshuolist-shuoshuo">
					<textarea rows="3" cols="50"></textarea>
					<div class="second-head-img-delete">删除</div>
				</div>
				<div class="second-head-img-shuoshuolist-shuoshuo">
					<textarea rows="3" cols="50"></textarea>
					<div class="second-head-img-delete">删除</div>
				</div>
				<div class="second-head-img-shuoshuolist-shuoshuo">
					<textarea rows="3" cols="50"></textarea>
					<div class="second-head-img-delete">删除</div>
				</div>
				<div class="second-head-img-more">
					<span>查看更多</span>
				</div>
			</div>
			<div class="second-head-img-picture">
				<div class="second-head-img-pictureList">
					<span><a>照片</a></span>
					<span class="second-head-img-uploadpicture"><a>上传照片</a></span>
				</div>

				<div class="second-head-img-picturegroup">
					<div class="second-head-img-picturegroup1">
						<div class="second-head-img-picturegroup1-img">
							<a>
								<img src="../img/31be1dd7cc2d4631aa1d99edfb26b080.jpg" alt="图片" width="200" height="200">
							</a>
							<div class="btn-group second-head-img-hidden">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									操作 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">编辑</a></li>
									<li><a href="#">删除</a></li>
									<li><a href="#">添加权限</a></li>
								</ul>
							</div>
						</div>
						<div class="second-head-img-picturegroupname">
							<span>分类1</span>
						</div>
					</div>
					<div class="second-head-img-picturegroup1">
						<div class="second-head-img-picturegroup1-img">
							<a>
								<img src="../img/31be1dd7cc2d4631aa1d99edfb26b080.jpg" alt="图片" width="200" height="200">
							</a>
							<div class="btn-group second-head-img-hidden">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									操作 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">编辑</a></li>
									<li><a href="#">删除</a></li>
									<li><a href="#">添加权限</a></li>
								</ul>
							</div>
						</div>
						<div class="second-head-img-picturegroupname">
							<span>分类2</span>
						</div>
					</div>
					<div class="second-head-img-picturegroup1">
						<div class="second-head-img-picturegroup1-img">
							<a>
								<img src="../img/31be1dd7cc2d4631aa1d99edfb26b080.jpg" alt="图片" width="200" height="200">
							</a>
							<div class="btn-group second-head-img-hidden">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									操作 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">编辑</a></li>
									<li><a href="#">删除</a></li>
									<li><a href="#">添加权限</a></li>
								</ul>
							</div>
						</div>
						<div class="second-head-img-picturegroupname">
							<span>分类3</span>
						</div>
					</div>
					<div class="second-head-img-picturegroup1">
						<div class="second-head-img-picturegroup1-img">
							<a>
								<img src="../img/31be1dd7cc2d4631aa1d99edfb26b080.jpg" alt="图片" width="200" height="200">
							</a>
							<div class="btn-group second-head-img-hidden">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									操作 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">编辑</a></li>
									<li><a href="#">删除</a></li>
									<li><a href="#">添加权限</a></li>
								</ul>
							</div>
						</div>
						<div class="second-head-img-picturegroupname">
							<span>分类4</span>
						</div>
					</div>
					<div class="second-head-img-picturegroup1">
						<div class="second-head-img-picturegroup1-img">
							<a>
								<img src="../img/31be1dd7cc2d4631aa1d99edfb26b080.jpg" alt="图片" width="200" height="200">
							</a>
							<div class="btn-group second-head-img-hidden">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									操作 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">编辑</a></li>
									<li><a href="#">删除</a></li>
									<li><a href="#">添加权限</a></li>
								</ul>
							</div>
						</div>
						<div class="second-head-img-picturegroupname">
							<span>分类5</span>
						</div>
					</div>
					<%--<div class="second-head-img-picturegroup2">--%>

					<%--</div>--%>
					<%--<div class="second-head-img-picturegroup3">--%>

					<%--</div>--%>
				</div>

			</div>
			<div class="second-head-img-line">-------------------------------------------------------------</div>
		</div>
	</div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../js/jquery-3.2.1.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../js/bootstrap.min.js"></script>
<script src="../js/mainpage.js"></script>
</body>

</html>
