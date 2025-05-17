<template>
	<el-main class="bg edit_wrap comtable_e">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce"> 
							<el-col v-if="$check_field('get','recruitment_title') || $check_field('add','recruitment_title') || $check_field('set','recruitment_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="招聘标题" prop="recruitment_title">
															<el-input id="recruitment_title" v-model="form['recruitment_title']" placeholder="请输入招聘标题"
							  v-if="(form['interview_notice_id'] && $check_field('set','recruitment_title')) || (!form['interview_notice_id'] && $check_field('add','recruitment_title'))" :disabled="disabledObj['recruitment_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','recruitment_title')">{{form['recruitment_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','enterprise_name') || $check_field('add','enterprise_name') || $check_field('set','enterprise_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="企业名称" prop="enterprise_name">
															<el-input id="enterprise_name" v-model="form['enterprise_name']" placeholder="请输入企业名称"
							  v-if="(form['interview_notice_id'] && $check_field('set','enterprise_name')) || (!form['interview_notice_id'] && $check_field('add','enterprise_name'))" :disabled="disabledObj['enterprise_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','enterprise_name')">{{form['enterprise_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','enterprise_users') || $check_field('add','enterprise_users') || $check_field('set','enterprise_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="企业用户" prop="enterprise_users">
																					<div v-if="user_group !== '管理员'">
							{{ get_user_session_enterprise_users(form['enterprise_users']) }}
							<el-select v-if="(form['interview_notice_id'] && $check_field('set','enterprise_users')) || (!form['interview_notice_id'] && $check_field('add','enterprise_users'))" id="enterprise_users" v-model="form['enterprise_users']" :disabled="disabledObj['enterprise_users_isDisabled']">
								<el-option v-for="o in list_user_enterprise_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','enterprise_users')" id="enterprise_users" v-model="form['enterprise_users']" :disabled="true">
								<el-option v-for="o in list_user_enterprise_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="enterprise_users" v-model="form['enterprise_users']" :disabled="disabledObj['enterprise_users_isDisabled']">
							<el-option v-for="o in list_user_enterprise_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','job_type') || $check_field('add','job_type') || $check_field('set','job_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="岗位类型" prop="job_type">
															<el-input id="job_type" v-model="form['job_type']" placeholder="请输入岗位类型"
							  v-if="(form['interview_notice_id'] && $check_field('set','job_type')) || (!form['interview_notice_id'] && $check_field('add','job_type'))" :disabled="disabledObj['job_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','job_type')">{{form['job_type']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','target_users') || $check_field('add','target_users') || $check_field('set','target_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="投放用户" prop="target_users">
																<el-select v-if="(form['interview_notice_id'] && $check_field('set','target_users')) || (!form['interview_notice_id'] && $check_field('add','target_users'))" id="target_users" v-model="form['target_users']" :disabled="disabledObj['target_users_isDisabled']">
							<el-option v-for="o in list_user_target_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','target_users')" id="target_users" v-model="form['target_users']" :disabled="true">
							<el-option v-for="o in list_user_target_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="用户姓名" prop="user_name">
															<el-input id="user_name" v-model="form['user_name']" placeholder="请输入用户姓名"
							  v-if="(form['interview_notice_id'] && $check_field('set','user_name')) || (!form['interview_notice_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','invitation_time') || $check_field('add','invitation_time') || $check_field('set','invitation_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="邀请时间" prop="invitation_time">
											<el-date-picker :disabled="disabledObj['invitation_time_isDisabled']" v-if="(form['interview_notice_id'] && $check_field('set','invitation_time')) || (!form['interview_notice_id'] && $check_field('add','invitation_time'))" id="invitation_time"
						v-model="form['invitation_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','invitation_time')">{{form['invitation_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','interview_notice') || $check_field('add','interview_notice') || $check_field('set','interview_notice')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="面试须知" prop="interview_notice">
															<el-input id="interview_notice" v-model="form['interview_notice']" placeholder="请输入面试须知"
							  v-if="(form['interview_notice_id'] && $check_field('set','interview_notice')) || (!form['interview_notice_id'] && $check_field('add','interview_notice'))" :disabled="disabledObj['interview_notice_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','interview_notice')">{{form['interview_notice']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','interview_location') || $check_field('add','interview_location') || $check_field('set','interview_location')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="面试地点" prop="interview_location">
															<el-input id="interview_location" v-model="form['interview_location']" placeholder="请输入面试地点"
							  v-if="(form['interview_notice_id'] && $check_field('set','interview_location')) || (!form['interview_notice_id'] && $check_field('add','interview_location'))" :disabled="disabledObj['interview_location_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','interview_location')">{{form['interview_location']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','interview_status') || $check_field('add','interview_status') || $check_field('set','interview_status')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="面试状态" prop="interview_status">
											<el-select id="interview_status" v-model="form['interview_status']"
						v-if="(form['interview_notice_id'] && $check_field('set','interview_status')) || (!form['interview_notice_id'] && $check_field('add','interview_status'))">
						<el-option v-for="o in list_interview_status" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','interview_status')">{{form['interview_status']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','interview_score') || $check_field('add','interview_score') || $check_field('set','interview_score')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="面试分数" prop="interview_score">
											<el-input-number id="interview_score" v-model.number="form['interview_score']"
						v-if="(form['interview_notice_id'] && $check_field('set','interview_score')) || (!form['interview_notice_id'] && $check_field('add','interview_score'))" :disabled="disabledObj['interview_score_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','interview_score')">{{form['interview_score']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','interview_comments') || $check_field('add','interview_comments') || $check_field('set','interview_comments')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="面试评语" prop="interview_comments">
											<el-input type="textarea" id="interview_comments" v-model="form['interview_comments']" placeholder="请输入面试评语"
						v-if="(form['interview_notice_id'] && $check_field('set','interview_comments')) || (!form['interview_notice_id'] && $check_field('add','interview_comments'))" :disabled="disabledObj['interview_comments_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','interview_comments')">{{form['interview_comments']}}</div>
							</el-form-item>
			</el-col>
						
	
	
		
		
	
	
	
		
		
	
		</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/interview_notice/view','set') || $check_action('/interview_notice/view','add') || $check_option('/interview_notice/table','examine')">
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
				<el-form-item v-else>
					<el-button @click="cancel()">返回</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		data() {
			return {
				field: "interview_notice_id",
				url_add: "~/api/interview_notice/add?",
				url_set: "~/api/interview_notice/set?",
				url_get_obj: "~/api/interview_notice/get_obj?",
				url_upload: "~/api/interview_notice/upload?",

				query: {
					"interview_notice_id": 0,
				},

				form: {
								"recruitment_title":  '', // 招聘标题
										"enterprise_name":  '', // 企业名称
										"enterprise_users": 0, // 企业用户
										"job_type":  '', // 岗位类型
										"target_users": 0, // 投放用户
										"user_name":  '', // 用户姓名
										"invitation_time":  '', // 邀请时间
										"interview_notice":  '', // 面试须知
										"interview_location":  '', // 面试地点
										"interview_status":  '', // 面试状态
										"interview_score":  0, // 面试分数
										"interview_comments":  '', // 面试评语
											"interview_notice_id": 0, // ID
															},
				disabledObj:{
								"recruitment_title_isDisabled": false,
										"enterprise_name_isDisabled": false,
										"enterprise_users_isDisabled": false,
										"job_type_isDisabled": false,
										"target_users_isDisabled": false,
										"user_name_isDisabled": false,
										"invitation_time_isDisabled": false,
										"interview_notice_isDisabled": false,
										"interview_location_isDisabled": false,
										"interview_status_isDisabled": false,
					          			"interview_score_isDisabled": false,
										"interview_comments_isDisabled": false,
										},

	
			
			
					// 用户列表
				list_user_enterprise_users: [],
						// 用户组
				group_user_enterprise_users: "",
					
			
					// 用户列表
				list_user_target_users: [],
					
			
			
			
									// 面试状态选项列表
				list_interview_status: ['待通知','已录用'],
	
			
			
		
			}
		},
		methods: {

	
	
			
	
			
	
				/**
			 * 获取企业用户用户列表
			 */
			async get_list_user_enterprise_users() {
                var json = await this.$get("~/api/user/get_list?user_group=企业用户");
                if(json.result && json.result.list){
                    this.list_user_enterprise_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取企业用户用户组
			 */
			async get_group_user_enterprise_users() {
							this.form["enterprise_users"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=企业用户");
				if(json.result && json.result.obj){
					this.group_user_enterprise_users = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_enterprise_users(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_enterprise_users.source_table+"/get_obj?"
				this.$get(url, user_id, function(res) {
					if (res.result && res.result.obj) {
						var arr = []
						for (let key in res.result.obj) {
							arr.push(key)
						}
						var arrForm = []
									for (let key in _this.form) {
							arrForm.push(key)
						}
												_this.form["enterprise_users"] = id
									_this.disabledObj['enterprise_users' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "enterprise_users") {
			                      _this.form[arrForm[j]] = res.result.obj[arr[i]]
			                      _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								  break;
								} else {
								  _this.disabledObj[arrForm[j] + '_isDisabled'] = true
								}
							  }
							}
						  }
						}
					}
				});
			},
					get_user_enterprise_users(id){
				var obj = this.list_user_enterprise_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
				/**
			 * 获取注册用户用户列表
			 */
			async get_list_user_target_users() {
                var json = await this.$get("~/api/user/get_list?user_group=注册用户");
                if(json.result && json.result.list){
                    this.list_user_target_users = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_target_users(id){
				var obj = this.list_user_target_users.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
														// 获取缓存数据附加
				form = $.db.get("form");
									$.push(this.form ,form);
							
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
								this.form[key] = form[dbKey]
							}
							if(dbKey === "source_table"){
								this.form['source_table'] = form[dbKey];
							}
							if(dbKey === "source_id"){
								this.form['source_id'] = form[dbKey];
							}
							if(dbKey === "source_user_id"){
								this.form['source_user_id'] = form[dbKey];
							}
						})
					})
				}
													        if (this.form["invitation_time"] && this.form["invitation_time"].indexOf("-")===-1){
            this.form["invitation_time"] = this.$toTime(parseInt(this.form["invitation_time"]),"yyyy-MM-dd hh:mm:ss")
        }
																$.db.del("form");

				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
																																			if(this.form["invitation_time"]=="0000-00-00 00:00:00"){
				  this.form["invitation_time"] = null;
				}
				if(parseInt(this.form["invitation_time"]) > 9999){
					this.form["invitation_time"] = this.$toTime(parseInt(this.form["invitation_time"]),"yyyy-MM-dd hh:mm:ss")
				}
																														

			},

																																																																																																async submit(param, func){
				if (!param) {
					param = this.form;
				}
						
				var pm = this.events("submit_before", Object.assign({}, param)) || param;
				var msg = await this.events("submit_check", pm);
				var ret;
				if (msg) {
					this.$toast(msg, 'danger');
				} else {
																																																																																												ret = this.events("submit_main", pm, func);
				}
				return ret;
			},
			
			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
						submit_check(param) {
					
																																																																									if (!param.invitation_time){
					return "邀请时间不能为空";
				}
																																																																							return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/interview_notice/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/interview_notice/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/interview_notice/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/interview_notice/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/interview_notice/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
									this.get_list_user_enterprise_users();
					this.get_group_user_enterprise_users();
										this.get_list_user_target_users();
																			},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
	
	.img_multiple{
		overflow: hidden;
	}
	.img_multiple .img_block{
		float: left;
		margin-right: 5px;
		margin-bottom: 5px;
		position: relative;
	}
	.img_multiple .img_block img{
		height: 100px;
		width: auto;
	}
	.img_multiple .img_del{
		position: absolute;
		top: 5px;
		right: 5px;
		width: 20px;
		height: 20px;
		background: #0000008a;
		color: #fff;
		line-height: 20px;
		text-align: center;
		border-radius: 100%;
		cursor: pointer;
	}




	
</style>
