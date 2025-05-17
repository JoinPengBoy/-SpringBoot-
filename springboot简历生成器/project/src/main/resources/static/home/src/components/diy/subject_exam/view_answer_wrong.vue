<template>
  <el-main class="bg edit_wrap question_edit_wrap wrong_answer_view">
    <el-form ref="form" :model="form" status-icon label-width="70px">
      <el-row class="row_e">
        <el-col :xs="24" :sm="24" :lg="24" class="el_form_item_warp">
			<div class="answer_wrong_title">科目</div>
			<div class="answer_wrong_info">{{form.subject_name}}</div>
        </el-col>

        <el-col :xs="24" :sm="24" :lg="24" class="el_form_item_warp">
		  <div class="answer_wrong_title">类型</div>
		  <div class="answer_wrong_info">{{form.type}}</div>
        </el-col>

        <el-col :xs="24" :sm="24" :lg="24" class="el_form_item_warp">
		  <div class="answer_wrong_title">题目</div>
		  <div class="answer_wrong_info">{{form.title}}</div>
        </el-col>
		
		<el-col :xs="24" :sm="24" :lg="24" class="el_form_item_warp">
		  <div class="answer_wrong_title">选项</div>
		  <div class="answer_wrong_info">{{form.question_item}}</div>
		</el-col>
		
		<el-col :xs="24" :sm="24" :lg="24" class="el_form_item_warp">
		  <div class="answer_wrong_title">提交答案</div>
		  <div class="answer_wrong_info">{{form.answers.replaceAll('"','')}}</div>
		</el-col>
		
		<el-col :xs="24" :sm="24" :lg="24" class="el_form_item_warp">
		  <div class="answer_wrong_title">参考答案</div>
		  <div class="answer_wrong_info">{{form.answer}}</div>
		</el-col>

      </el-row>
      <el-col :xs="24" :sm="24" :lg="24" class="el_form_btn_warp">
          <el-form-item>
            <el-col
              :xs="24"
              :sm="24"
              :lg="12"
              class="el_form_btn el_form_btn_2"
            >
              <el-button style="width: 100%; float: right" @click="cancel()"
                >返回</el-button
              >
            </el-col>
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
      field: "user_answer_id",
      url_add: "~/api/user_answer_wrong/add?",
      url_set: "~/api/user_answer_wrong/set?",
      url_get_obj: "~/api/user_answer_wrong/get_obj?",
      url_upload: "~/api/user_answer_wrong/upload?",

      query: {
        user_answer_id: 0,
      },

      form: {
        user_answer_id: 0,
        type: "",
        answers:"",
		    subject_name:"",
        title: "",
        question_item: "",
        answer: "",
        score: 0,
        exam_id: 0,
      },
      list_subject: [],
    };
  },
  methods: {
    init_exam_id() {
      let exam_id = this.$route.query.exam_id;
      if (exam_id) {
        this.form.exam_id = exam_id;
      }
    },
    submit_check() {},

    /**
     * 获取科目列表
     */
    async get_subject_list() {
      var json = await this.$get("~/api/subject/get_list?");
      if (json.result) {
        this.list_subject = json.result.list;
      } else if (json.error) {
        console.error(json.error);
      }
    },
  },
  created() {
    this.init_exam_id();
    this.get_subject_list();
  },
};
</script>

<style>
.wrong_answer_view{
	margin: 30px 0;
	background: #ffffff96 !important;
	border-radius: 3px;
	padding: 50px !important;
}
.wrong_answer_view .el_form_item_warp{
	display: flex;
	color: #555;
	line-height: 70px;
}
.edit_wrap .el_form_item_warp:nth-child(n+3){
	width: 100% !important;
}
.wrong_answer_view .el_form_item_warp .answer_wrong_title{
	font-weight: bold;
	width: 100px;
}
.wrong_answer_view .el_form_item_warp .answer_wrong_info{}
.el_form_btn_warp{
	margin-top: 20px
}
</style>
