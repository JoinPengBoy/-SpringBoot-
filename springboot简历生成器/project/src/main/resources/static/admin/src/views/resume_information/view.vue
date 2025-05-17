<template>
	<el-main class="bg edit_wrap comtable_e">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
		<el-row class="row_ce"> 
							<el-col v-if="$check_field('get','recruitment_title') || $check_field('add','recruitment_title') || $check_field('set','recruitment_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="招聘标题" prop="recruitment_title">
															<el-input id="recruitment_title" v-model="form['recruitment_title']" placeholder="请输入招聘标题"
							  v-if="(form['resume_information_id'] && $check_field('set','recruitment_title')) || (!form['resume_information_id'] && $check_field('add','recruitment_title'))" :disabled="disabledObj['recruitment_title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','recruitment_title')">{{form['recruitment_title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','enterprise_name') || $check_field('add','enterprise_name') || $check_field('set','enterprise_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="企业名称" prop="enterprise_name">
															<el-input id="enterprise_name" v-model="form['enterprise_name']" placeholder="请输入企业名称"
							  v-if="(form['resume_information_id'] && $check_field('set','enterprise_name')) || (!form['resume_information_id'] && $check_field('add','enterprise_name'))" :disabled="disabledObj['enterprise_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','enterprise_name')">{{form['enterprise_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','enterprise_users') || $check_field('add','enterprise_users') || $check_field('set','enterprise_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="企业用户" prop="enterprise_users">
																<el-select v-if="(form['resume_information_id'] && $check_field('set','enterprise_users')) || (!form['resume_information_id'] && $check_field('add','enterprise_users'))" id="enterprise_users" v-model="form['enterprise_users']" :disabled="disabledObj['enterprise_users_isDisabled']">
							<el-option v-for="o in list_user_enterprise_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','enterprise_users')" id="enterprise_users" v-model="form['enterprise_users']" :disabled="true">
							<el-option v-for="o in list_user_enterprise_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','job_type') || $check_field('add','job_type') || $check_field('set','job_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="岗位类型" prop="job_type">
															<el-input id="job_type" v-model="form['job_type']" placeholder="请输入岗位类型"
							  v-if="(form['resume_information_id'] && $check_field('set','job_type')) || (!form['resume_information_id'] && $check_field('add','job_type'))" :disabled="disabledObj['job_type_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','job_type')">{{form['job_type']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','target_users') || $check_field('add','target_users') || $check_field('set','target_users')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="投放用户" prop="target_users">
																					<div v-if="user_group !== '管理员'">
							{{ get_user_session_target_users(form['target_users']) }}
							<el-select v-if="(form['resume_information_id'] && $check_field('set','target_users')) || (!form['resume_information_id'] && $check_field('add','target_users'))" id="target_users" v-model="form['target_users']" :disabled="disabledObj['target_users_isDisabled']">
								<el-option v-for="o in list_user_target_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','target_users')" id="target_users" v-model="form['target_users']" :disabled="true">
								<el-option v-for="o in list_user_target_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="target_users" v-model="form['target_users']" :disabled="disabledObj['target_users_isDisabled']">
							<el-option v-for="o in list_user_target_users" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','user_name') || $check_field('add','user_name') || $check_field('set','user_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="用户姓名" prop="user_name">
															<el-input id="user_name" v-model="form['user_name']" placeholder="请输入用户姓名"
							  v-if="(form['resume_information_id'] && $check_field('set','user_name')) || (!form['resume_information_id'] && $check_field('add','user_name'))" :disabled="disabledObj['user_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_name')">{{form['user_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','user_gender') || $check_field('add','user_gender') || $check_field('set','user_gender')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="用户性别" prop="user_gender">
															<el-input id="user_gender" v-model="form['user_gender']" placeholder="请输入用户性别"
							  v-if="(form['resume_information_id'] && $check_field('set','user_gender')) || (!form['resume_information_id'] && $check_field('add','user_gender'))" :disabled="disabledObj['user_gender_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_gender')">{{form['user_gender']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','user_age') || $check_field('add','user_age') || $check_field('set','user_age')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="用户年龄" prop="user_age">
															<el-input id="user_age" v-model="form['user_age']" placeholder="请输入用户年龄"
							  v-if="(form['resume_information_id'] && $check_field('set','user_age')) || (!form['resume_information_id'] && $check_field('add','user_age'))" :disabled="disabledObj['user_age_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','user_age')">{{form['user_age']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','contact_information') || $check_field('add','contact_information') || $check_field('set','contact_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="联系方式" prop="contact_information">
											<el-input id="contact_information" v-model="form['contact_information']" placeholder="请输入联系方式" type="tel"
						v-if="(form['resume_information_id'] && $check_field('set','contact_information')) || (!form['resume_information_id'] && $check_field('add','contact_information'))">
					</el-input>
					<div v-else-if="$check_field('get','contact_information')">{{form['contact_information']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','educational_background') || $check_field('add','educational_background') || $check_field('set','educational_background')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="教育背景" prop="educational_background">
															<el-input id="educational_background" v-model="form['educational_background']" placeholder="请输入教育背景"
							  v-if="(form['resume_information_id'] && $check_field('set','educational_background')) || (!form['resume_information_id'] && $check_field('add','educational_background'))" :disabled="disabledObj['educational_background_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','educational_background')">{{form['educational_background']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','work_experience') || $check_field('add','work_experience') || $check_field('set','work_experience')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="工作经历" prop="work_experience">
															<el-input id="work_experience" v-model="form['work_experience']" placeholder="请输入工作经历"
							  v-if="(form['resume_information_id'] && $check_field('set','work_experience')) || (!form['resume_information_id'] && $check_field('add','work_experience'))" :disabled="disabledObj['work_experience_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','work_experience')">{{form['work_experience']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','placement_time') || $check_field('add','placement_time') || $check_field('set','placement_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="投放时间" prop="placement_time">
											<el-date-picker :disabled="disabledObj['placement_time_isDisabled']" v-if="(form['resume_information_id'] && $check_field('set','placement_time')) || (!form['resume_information_id'] && $check_field('add','placement_time'))" id="placement_time"
						v-model="form['placement_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','placement_time')">{{form['placement_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','resume_attachment') || $check_field('add','resume_attachment') || $check_field('set','resume_attachment')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="简历附件" prop="resume_attachment">
															<div v-if="disabledObj['resume_attachment_isDisabled']">
						<div v-if="$check_field('get','resume_attachment')">
							<el-button type="primary" @click="$download($fullUrl(form['resume_attachment']),form['resume_attachment'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
					<div v-else>
						<el-upload v-if="(form['resume_information_id'] && $check_field('set','resume_attachment')) || (!form['resume_information_id'] && $check_field('add','resume_attachment'))" class="upload-demo" drag
								   action="" style="max-width: 300px;width: 100%;" :http-request="upload_resume_attachment" :limit="1" accept="">
							<i class="el-icon-upload"></i>
							<div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
						</el-upload>
						<div v-else-if="$check_field('get','resume_attachment')">
							<el-button type="primary" @click="$download($fullUrl(form['resume_attachment']),form['resume_attachment'])">下载<i
									class="el-icon-download el-icon--right"></i></el-button>
						</div>
					</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','reason_for_advertising_placement') || $check_field('add','reason_for_advertising_placement') || $check_field('set','reason_for_advertising_placement')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="投放原因" prop="reason_for_advertising_placement">
															<el-input id="reason_for_advertising_placement" v-model="form['reason_for_advertising_placement']" placeholder="请输入投放原因"
							  v-if="(form['resume_information_id'] && $check_field('set','reason_for_advertising_placement')) || (!form['resume_information_id'] && $check_field('add','reason_for_advertising_placement'))" :disabled="disabledObj['reason_for_advertising_placement_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','reason_for_advertising_placement')">{{form['reason_for_advertising_placement']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','resume_rating') || $check_field('add','resume_rating') || $check_field('set','resume_rating')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="简历评分" prop="resume_rating">
											<el-select id="resume_rating" v-model="form['resume_rating']"
						v-if="(form['resume_information_id'] && $check_field('set','resume_rating')) || (!form['resume_information_id'] && $check_field('add','resume_rating'))">
						<el-option v-for="o in list_resume_rating" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','resume_rating')">{{form['resume_rating']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','resume_marking') || $check_field('add','resume_marking') || $check_field('set','resume_marking')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="简历标记" prop="resume_marking">
											<el-select id="resume_marking" v-model="form['resume_marking']"
						v-if="(form['resume_information_id'] && $check_field('set','resume_marking')) || (!form['resume_information_id'] && $check_field('add','resume_marking'))">
						<el-option v-for="o in list_resume_marking" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','resume_marking')">{{form['resume_marking']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="$check_field('get','posting_remarks') || $check_field('add','posting_remarks') || $check_field('set','posting_remarks')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
							<el-form-item label="投放备注" prop="posting_remarks">
											<el-input type="textarea" id="posting_remarks" v-model="form['posting_remarks']" placeholder="请输入投放备注"
						v-if="(form['resume_information_id'] && $check_field('set','posting_remarks')) || (!form['resume_information_id'] && $check_field('add','posting_remarks'))" :disabled="disabledObj['posting_remarks_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','posting_remarks')">{{form['posting_remarks']}}</div>
							</el-form-item>
			</el-col>
								<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="(form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())" :disabled="true">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
				</el-form-item>
			</el-col>
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核回复" prop="examine_reply">
					<el-input id="examine_reply" v-model="form['examine_reply']" placeholder="请输入审核回复"
						v-if="(form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())" :disabled="true"></el-input>
					<div v-else>{{form["examine_reply"]}}</div>
				</el-form-item>
			</el-col>
	
	
	
		
		
						<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp" v-if="!form['source_user_id'] && 0 > 0">
			  <el-form-item label="邀请面试限次">
				<el-input id="limit_times" v-model="form['interview_notice_limit_times']" placeholder="邀请面试限制次数，0为不限"
						  v-if="$check_option('/resume_information/view','can_limits')"
				></el-input>
				<div v-else-if="$check_action('/resume_information/view','get')" v-html="form['interview_notice_limit_times']"></div>
			  </el-form-item>
			</el-col>
			
	
	
		
		
	
		</el-row>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item v-if="$check_action('/resume_information/view','set') || $check_action('/resume_information/view','add') || $check_option('/resume_information/table','examine')">
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
				field: "resume_information_id",
				url_add: "~/api/resume_information/add?",
				url_set: "~/api/resume_information/set?",
				url_get_obj: "~/api/resume_information/get_obj?",
				url_upload: "~/api/resume_information/upload?",

				query: {
					"resume_information_id": 0,
				},

				form: {
								"recruitment_title":  '', // 招聘标题
										"enterprise_name":  '', // 企业名称
										"enterprise_users": 0, // 企业用户
										"job_type":  '', // 岗位类型
										"target_users": 0, // 投放用户
										"user_name":  '', // 用户姓名
										"user_gender":  '', // 用户性别
										"user_age":  '', // 用户年龄
										"contact_information":  '', // 联系方式
										"educational_background":  '', // 教育背景
										"work_experience":  '', // 工作经历
										"placement_time":  '', // 投放时间
										"resume_attachment":  '', // 简历附件
										"reason_for_advertising_placement":  '', // 投放原因
										"resume_rating":  '', // 简历评分
										"resume_marking":  '', // 简历标记
										"posting_remarks":  '', // 投放备注
									"examine_state": "未审核",
							"examine_reply": "",
							"resume_information_id": 0, // ID
													"interview_notice_limit_times": 0, // 邀请面试限制次数
												},
				disabledObj:{
								"recruitment_title_isDisabled": false,
										"enterprise_name_isDisabled": false,
										"enterprise_users_isDisabled": false,
										"job_type_isDisabled": false,
										"target_users_isDisabled": false,
										"user_name_isDisabled": false,
										"user_gender_isDisabled": false,
										"user_age_isDisabled": false,
										"contact_information_isDisabled": false,
										"educational_background_isDisabled": false,
										"work_experience_isDisabled": false,
										"placement_time_isDisabled": false,
										"resume_attachment_isDisabled": false,
										"reason_for_advertising_placement_isDisabled": false,
										"resume_rating_isDisabled": false,
										"resume_marking_isDisabled": false,
										"posting_remarks_isDisabled": false,
										},

	
			
			
					// 用户列表
				list_user_enterprise_users: [],
					
			
					// 用户列表
				list_user_target_users: [],
						// 用户组
				group_user_target_users: "",
					
			
			
			
			
			
			
			
			
									// 简历评分选项列表
				list_resume_rating: ['一星','二星','三星','四星','五星'],
	
									// 简历标记选项列表
				list_resume_marking: ['待面试','不合适'],
	
			
		
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
					/**
			 * 获取注册用户用户组
			 */
			async get_group_user_target_users() {
							this.form["target_users"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=注册用户");
				if(json.result && json.result.obj){
					this.group_user_target_users = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_target_users(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_target_users.source_table+"/get_obj?"
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
												_this.form["target_users"] = id
									_this.disabledObj['target_users' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "target_users") {
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
			 * 上传简历附件
			 * @param {Object} param 文件参数
			 */
			upload_resume_attachment(param){
									this.uploadFile(param.file, "resume_attachment");
								},
	
	
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
									// 获取缓存数据附加
				form = $.db.get("form");
						if(form != null){
					if("examine_state" in form){
						delete form.examine_state
					}
								if("examine_reply" in form){
						delete form.examine_reply
					}
							}
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
																							        if (this.form["placement_time"] && this.form["placement_time"].indexOf("-")===-1){
            this.form["placement_time"] = this.$toTime(parseInt(this.form["placement_time"]),"yyyy-MM-dd hh:mm:ss")
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
																																																												if(this.form["placement_time"]=="0000-00-00 00:00:00"){
				  this.form["placement_time"] = null;
				}
				if(parseInt(this.form["placement_time"]) > 9999){
					this.form["placement_time"] = this.$toTime(parseInt(this.form["placement_time"]),"yyyy-MM-dd hh:mm:ss")
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
					
																																																																																																	let contact_information_phone_regular = /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/;
				if(param.contact_information && !contact_information_phone_regular.test(param.contact_information)){
					return "手机号格式错误"
				}
																																					if (!param.placement_time){
					return "投放时间不能为空";
				}
																																																																							return null;
			},

			is_view(){
				// var bl = this.user_group == "管理员";
				var bl = false;

				if(!bl){
					bl = this.$check_action('/resume_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/resume_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/resume_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/resume_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/resume_information/view','get');
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
										this.get_list_user_target_users();
					this.get_group_user_target_users();
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
