<template>
  <div class="page_search search_index">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>

				<!-- 文章搜索结果 -->
			  <list_result_search
				:list="result_article"
				title="新闻资讯"
				source_table="article"
			  ></list_result_search>

				<!-- 论坛搜索结果 -->
			  <list_result_search
				:list="result_forum"
				title="社交论坛"
				source_table="forum"
			  ></list_result_search>

						  <list_result_search
				v-if="$check_action('/registered_user/list', 'get')"
				:list="result_registered_user_user_name"
				title="注册用户用户姓名"
				source_table="registered_user"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/registered_user/list', 'get')"
				:list="result_registered_user_user_gender"
				title="注册用户用户性别"
				source_table="registered_user"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/enterprise_users/list', 'get')"
				:list="result_enterprise_users_enterprise_name"
				title="企业用户企业名称"
				source_table="enterprise_users"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/enterprise_users/list', 'get')"
				:list="result_enterprise_users_registered_capital"
				title="企业用户注册资本"
				source_table="enterprise_users"
			  ></list_result_search>
																		  <list_result_search
				v-if="$check_action('/recruitment_information/list', 'get')"
				:list="result_recruitment_information_enterprise_name"
				title="招聘信息企业名称"
				source_table="recruitment_information"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/recruitment_information/list', 'get')"
				:list="result_recruitment_information_registered_capital"
				title="招聘信息注册资本"
				source_table="recruitment_information"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/recruitment_information/list', 'get')"
				:list="result_recruitment_information_job_type"
				title="招聘信息岗位类型"
				source_table="recruitment_information"
			  ></list_result_search>
																											  <list_result_search
				v-if="$check_action('/job_type/list', 'get')"
				:list="result_job_type_job_type"
				title="岗位类型岗位类型"
				source_table="job_type"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/resume_information/list', 'get')"
				:list="result_resume_information_enterprise_name"
				title="简历信息企业名称"
				source_table="resume_information"
			  ></list_result_search>
																	  <list_result_search
				v-if="$check_action('/resume_information/list', 'get')"
				:list="result_resume_information_user_name"
				title="简历信息用户姓名"
				source_table="resume_information"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/resume_information/list', 'get')"
				:list="result_resume_information_user_gender"
				title="简历信息用户性别"
				source_table="resume_information"
			  ></list_result_search>
																																										  <list_result_search
				v-if="$check_action('/interview_notice/list', 'get')"
				:list="result_interview_notice_enterprise_name"
				title="面试通知企业名称"
				source_table="interview_notice"
			  ></list_result_search>
																	  <list_result_search
				v-if="$check_action('/interview_notice/list', 'get')"
				:list="result_interview_notice_user_name"
				title="面试通知用户姓名"
				source_table="interview_notice"
			  ></list_result_search>
																								</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
	  "result_article": [],
	  "result_forum": [],
						"result_registered_user_user_name":[],
								"result_registered_user_user_gender":[],
																					"result_enterprise_users_enterprise_name":[],
								"result_enterprise_users_registered_capital":[],
																		"result_recruitment_information_enterprise_name":[],
											"result_recruitment_information_registered_capital":[],
								"result_recruitment_information_job_type":[],
																											"result_job_type_job_type":[],
												"result_resume_information_enterprise_name":[],
																	"result_resume_information_user_name":[],
								"result_resume_information_user_gender":[],
																																										"result_interview_notice_enterprise_name":[],
																	"result_interview_notice_user_name":[],
																						};
  },
  methods: {
	/**
	 * 获取文章
	 */
	get_article() {
	  this.$get("~/api/article/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_article = json.result.list;
		}
	  });
	},
	/**
	 * 获取社交论坛
	 */
	get_forum() {
	  this.$get("~/api/forum/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_forum = json.result.list;
		}
	  });
	},

				/**
	 * 获取user_name
	 */
	get_registered_user_user_name(){
		let url = "~/api/registered_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "user_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_registered_user_user_name = json.result.list;
			result_registered_user_user_name.map(o => o.title = o['user_name'])
	  			this.result_registered_user_user_name = result_registered_user_user_name
		 	}
		});
	},
						/**
	 * 获取user_gender
	 */
	get_registered_user_user_gender(){
		let url = "~/api/registered_user/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "user_gender": this.query.word }, (json) => {
		  if (json.result) {
			var result_registered_user_user_gender = json.result.list;
			result_registered_user_user_gender.map(o => o.title = o['user_gender'])
	  			this.result_registered_user_user_gender = result_registered_user_user_gender
		 	}
		});
	},
																			/**
	 * 获取enterprise_name
	 */
	get_enterprise_users_enterprise_name(){
		let url = "~/api/enterprise_users/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "enterprise_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_enterprise_users_enterprise_name = json.result.list;
			result_enterprise_users_enterprise_name.map(o => o.title = o['enterprise_name'])
	  			this.result_enterprise_users_enterprise_name = result_enterprise_users_enterprise_name
		 	}
		});
	},
						/**
	 * 获取registered_capital
	 */
	get_enterprise_users_registered_capital(){
		let url = "~/api/enterprise_users/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "registered_capital": this.query.word }, (json) => {
		  if (json.result) {
			var result_enterprise_users_registered_capital = json.result.list;
			result_enterprise_users_registered_capital.map(o => o.title = o['registered_capital'])
	  			this.result_enterprise_users_registered_capital = result_enterprise_users_registered_capital
		 	}
		});
	},
																/**
	 * 获取enterprise_name
	 */
	get_recruitment_information_enterprise_name(){
		let url = "~/api/recruitment_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "enterprise_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_recruitment_information_enterprise_name = json.result.list;
			result_recruitment_information_enterprise_name.map(o => o.title = o['enterprise_name'])
	  			this.result_recruitment_information_enterprise_name = result_recruitment_information_enterprise_name
		 	}
		});
	},
									/**
	 * 获取registered_capital
	 */
	get_recruitment_information_registered_capital(){
		let url = "~/api/recruitment_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "registered_capital": this.query.word }, (json) => {
		  if (json.result) {
			var result_recruitment_information_registered_capital = json.result.list;
			result_recruitment_information_registered_capital.map(o => o.title = o['registered_capital'])
	  			this.result_recruitment_information_registered_capital = result_recruitment_information_registered_capital
		 	}
		});
	},
						/**
	 * 获取job_type
	 */
	get_recruitment_information_job_type(){
		let url = "~/api/recruitment_information/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "job_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_recruitment_information_job_type = json.result.list;
			result_recruitment_information_job_type.map(o => o.title = o['job_type'])
	  			this.result_recruitment_information_job_type = result_recruitment_information_job_type
		 	}
		});
	},
																									/**
	 * 获取job_type
	 */
	get_job_type_job_type(){
		let url = "~/api/job_type/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "job_type": this.query.word }, (json) => {
		  if (json.result) {
			var result_job_type_job_type = json.result.list;
			result_job_type_job_type.map(o => o.title = o['job_type'])
	  			this.result_job_type_job_type = result_job_type_job_type
		 	}
		});
	},
										/**
	 * 获取enterprise_name
	 */
	get_resume_information_enterprise_name(){
		let url = "~/api/resume_information/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "enterprise_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_resume_information_enterprise_name = json.result.list;
			result_resume_information_enterprise_name.map(o => o.title = o['enterprise_name'])
	  			this.result_resume_information_enterprise_name = result_resume_information_enterprise_name
		 	}
		});
	},
															/**
	 * 获取user_name
	 */
	get_resume_information_user_name(){
		let url = "~/api/resume_information/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "user_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_resume_information_user_name = json.result.list;
			result_resume_information_user_name.map(o => o.title = o['user_name'])
	  			this.result_resume_information_user_name = result_resume_information_user_name
		 	}
		});
	},
						/**
	 * 获取user_gender
	 */
	get_resume_information_user_gender(){
		let url = "~/api/resume_information/get_list?like=0";
				url = url+"&examine_state=已通过";
				this.$get(url, { page: 1, size: 10, "user_gender": this.query.word }, (json) => {
		  if (json.result) {
			var result_resume_information_user_gender = json.result.list;
			result_resume_information_user_gender.map(o => o.title = o['user_gender'])
	  			this.result_resume_information_user_gender = result_resume_information_user_gender
		 	}
		});
	},
																																								/**
	 * 获取enterprise_name
	 */
	get_interview_notice_enterprise_name(){
		let url = "~/api/interview_notice/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "enterprise_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_interview_notice_enterprise_name = json.result.list;
			result_interview_notice_enterprise_name.map(o => o.title = o['enterprise_name'])
	  			this.result_interview_notice_enterprise_name = result_interview_notice_enterprise_name
		 	}
		});
	},
															/**
	 * 获取user_name
	 */
	get_interview_notice_user_name(){
		let url = "~/api/interview_notice/get_list?like=0";
				this.$get(url, { page: 1, size: 10, "user_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_interview_notice_user_name = json.result.list;
			result_interview_notice_user_name.map(o => o.title = o['user_name'])
	  			this.result_interview_notice_user_name = result_interview_notice_user_name
		 	}
		});
	},
																					
  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
	this.get_article();
	this.get_forum();
					this.get_registered_user_user_name();
							this.get_registered_user_user_gender();
																				this.get_enterprise_users_enterprise_name();
							this.get_enterprise_users_registered_capital();
																	this.get_recruitment_information_enterprise_name();
										this.get_recruitment_information_registered_capital();
							this.get_recruitment_information_job_type();
																										this.get_job_type_job_type();
											this.get_resume_information_enterprise_name();
																this.get_resume_information_user_name();
							this.get_resume_information_user_gender();
																																									this.get_interview_notice_enterprise_name();
																this.get_interview_notice_user_name();
																					  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_article();
	  this.get_forum();
				  this.get_registered_user_user_name();
						  this.get_registered_user_user_gender();
																			  this.get_enterprise_users_enterprise_name();
						  this.get_enterprise_users_registered_capital();
																  this.get_recruitment_information_enterprise_name();
									  this.get_recruitment_information_registered_capital();
						  this.get_recruitment_information_job_type();
																									  this.get_job_type_job_type();
										  this.get_resume_information_enterprise_name();
															  this.get_resume_information_user_name();
						  this.get_resume_information_user_gender();
																																								  this.get_interview_notice_enterprise_name();
															  this.get_interview_notice_user_name();
																						},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
