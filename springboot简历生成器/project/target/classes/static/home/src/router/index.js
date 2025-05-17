import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue'
import login from '../views/account/login.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index
	},
	// 登录
	{
		path: '/account/login',
		name: 'login',
		component: login
	},
	// 忘记密码
	{
		path: '/account/forgot',
		name: 'forgot',
		component: () => import('../views/account/forgot.vue')
	},
	// 注册账号
	{
		path: '/account/register',
		name: 'register',
		component: () => import('../views/account/register.vue')
	},
		// 媒体图片
	{
		path: '/media/image',
		name: 'media_image',
		component: () => import('../views/media/image.vue')
	},
	// 音乐
	{
		path: '/media/music',
		name: 'media_music',
		component: () => import('../views/media/music.vue')
	},
	// 媒体视频
	{
		path: '/media/video',
		name: 'media_video',
		component: () => import('../views/media/video.vue')
	},
	// 媒体视频
	{
		path: '/user_center/index',
		name: 'user_center_index',
		component: () => import('../views/user_center/index.vue')
	},
	// 文章路由
	{
		path: '/article/list',
		name: 'article_list',
		component: () => import('../views/article/list.vue')
	},
	{
		path: '/article/details',
		name: 'article_details',
		component: () => import('../views/article/details.vue')
	},
	// 浏览网站
	// 收藏路由
	{
		path: '/user/collect',
		name: 'collect_list',
		component: () => import('../views/user/collect.vue')
	},

	// 论坛路由
	{
		path: '/forum/list',
		name: 'forum_list',
		component: () => import('../views/forum/list.vue')
	},

	{
		path: '/forum/details',
		name: 'forum_details',
		component: () => import('../views/forum/details.vue')
	},
	{
		path: '/forum/edit',
		name: 'forum_edit',
		component: () => import('../views/forum/edit.vue')
	},
	{
		path: '/forum/table',
		name: 'forum_table',
		component: () => import('../views/forum/table.vue')
	},
	{
		path: '/forum/view',
		name: 'forum_view',
		component: () => import('../views/forum/view.vue')
	},

	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue')
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue')
	},

	



	// 公告路由
	{
		path: '/notice/list',
		name: 'notice_list',
		component: () => import('../views/notice/list.vue')
	},
	{
		path: '/notice/details',
		name: 'notice_details',
		component: () => import('../views/notice/details.vue')
	},
	// 注册用户表格路由
	{
		path: '/registered_user/table',
		name: '/registered_user_table',
		component: () => import('../views/registered_user/table.vue')
	},
	// 注册用户详情路由
	{
		path: '/registered_user/view',
		name: '/registered_user_view',
		component: () => import('../views/registered_user/view.vue')
	},
	
	
		
		
		
	// 企业用户表格路由
	{
		path: '/enterprise_users/table',
		name: '/enterprise_users_table',
		component: () => import('../views/enterprise_users/table.vue')
	},
	// 企业用户详情路由
	{
		path: '/enterprise_users/view',
		name: '/enterprise_users_view',
		component: () => import('../views/enterprise_users/view.vue')
	},
	
	
		
		
		
	// 招聘信息表格路由
	{
		path: '/recruitment_information/table',
		name: '/recruitment_information_table',
		component: () => import('../views/recruitment_information/table.vue')
	},
	// 招聘信息详情路由
	{
		path: '/recruitment_information/view',
		name: '/recruitment_information_view',
		component: () => import('../views/recruitment_information/view.vue')
	},
	
		// 招聘信息列表路由
	{
		path: '/recruitment_information/list',
		name: '/recruitment_information_list',
		component: () => import('../views/recruitment_information/list.vue')
	},
	
		// 招聘信息详情路由
	{
		path: '/recruitment_information/details',
		name: '/recruitment_information_details',
		component: () => import('../views/recruitment_information/details.vue')
	},
		
		
		
	// 岗位类型表格路由
	{
		path: '/job_type/table',
		name: '/job_type_table',
		component: () => import('../views/job_type/table.vue')
	},
	// 岗位类型详情路由
	{
		path: '/job_type/view',
		name: '/job_type_view',
		component: () => import('../views/job_type/view.vue')
	},
	
	
		
		
		
	// 简历信息表格路由
	{
		path: '/resume_information/table',
		name: '/resume_information_table',
		component: () => import('../views/resume_information/table.vue')
	},
	// 简历信息详情路由
	{
		path: '/resume_information/view',
		name: '/resume_information_view',
		component: () => import('../views/resume_information/view.vue')
	},
		// 简历信息添加路由
	{
		path: '/resume_information/edit',
		name: '/resume_information_edit',
		component: () => import('../views/resume_information/edit.vue')
	},
	
	
		
		
		
	// 面试通知表格路由
	{
		path: '/interview_notice/table',
		name: '/interview_notice_table',
		component: () => import('../views/interview_notice/table.vue')
	},
	// 面试通知详情路由
	{
		path: '/interview_notice/view',
		name: '/interview_notice_view',
		component: () => import('../views/interview_notice/view.vue')
	},
	
	
		
		
		

	// 用户路由
	{
		path: '/user/index',
		name: 'user_index',
		component: () => import('../views/user/index.vue')
	},
	// 基本信息
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue')
	},
	// 找回密码
	{
		path: '/user/password',
		name: 'user_password',
		component: () => import('../views/user/password.vue')
	},

	// 搜索
	{
		path: '/search',
		name: 'search',
		component: () => import('../views/search/index.vue')
	},
	// 局部搜索
	{
		path: '/search/details',
		name: 'search_details',
		component: () => import('../views/search/details.vue')
	}
]

const router = new VueRouter({
	mode: 'hash',
	base: process.env.BASE_URL,
	routes
})

router.afterEach((to, from, next) => {
	let title = "简历生成器-home";
	document.title = title;
	document.logo = "简历生成器"
})

export default router
