<template>
  <div class="list_menu diy_menu">
    <router-link
            to="/user_center/index"
            class="menu_item"
            :class="{ selected: this.$route.path=== '/user_center/index'}"
     >
      <span class="left_span">个人首页</span>
      <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
    </router-link>
          <router-link
          to="/registered_user/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/registered_user/table'}"
          v-if="$check_action('/registered_user/table','get')">
        <span class="left_span">注册用户</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/enterprise_users/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/enterprise_users/table'}"
          v-if="$check_action('/enterprise_users/table','get')">
        <span class="left_span">企业用户</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/recruitment_information/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/recruitment_information/table'}"
          v-if="$check_action('/recruitment_information/table','get')">
        <span class="left_span">招聘信息</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/job_type/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/job_type/table'}"
          v-if="$check_action('/job_type/table','get')">
        <span class="left_span">岗位类型</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/resume_information/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/resume_information/table'}"
          v-if="$check_action('/resume_information/table','get')">
        <span class="left_span">简历信息</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
              <router-link
          to="/interview_notice/table"
          class="menu_item"
          :class="{ selected: this.$route.path=== '/interview_notice/table'}"
          v-if="$check_action('/interview_notice/table','get')">
        <span class="left_span">面试通知</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
          <router-link
              to="/forum/table"
              class="menu_item"
              :class="{ selected: this.$route.path=== '/forum/table'}"
              v-if="$check_action('/forum/table','get')">
        <span class="left_span">{{$page_title("/forum/table") || "论坛"}}</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
      </router-link>
  <router-link
              to="/user/collect"
              class="menu_item"
              :class="{ selected: this.$route.path=== '/user/collect'}"
              v-if="$check_action('/collect/list','get')">
        <span class="left_span">收藏</span>
        <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
  </router-link>
	<router-link
	            to="/comment/table"
	            class="menu_item"
	            :class="{ selected: this.$route.path=== '/comment/table'}"
	            v-if="$check_action('/comment/table','get')">
	      <span class="left_span">评论管理</span>
	      <span class="right_span"><b-icon icon="house-fill"></b-icon></span>
	</router-link>
  </div>
</template>

<script>
import mixin from "@/mixins/page.js";
export default {
  mixins: [mixin],
  data() {
    return {
    };
  },
  mounted() {
  },
  methods: {
  },

  components: {
  },
};
</script>

<style scoped>
.list_menu {
  flex: 0 0 25%;
  border-bottom: 1px solid #eee;
}
.menu_item {
  display: flex;
  justify-content: space-between;
  padding: 15px 20px;
  border: 1px solid #eee;
  border-bottom: none;
  background-color: #fff;
}
.menu_item.selected {
  background-color: #000;
}
.menu_item.selected span {
  color: #fff ;
}
.content {
  flex: 0 0 74%;
}
</style>
