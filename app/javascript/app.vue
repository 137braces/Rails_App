<template>
  <div id="app-link">
    <div class="side">
    
    <div style="margin-top:7%;">
      
      <div class="title-gem"><a href="/" class="fas fa-gem fa-xs">RailsApp</a></div>
    
    </div>
    <div class="container wrapper fixed-bottom">
          <ul class="row item-bar">
                <li><router-link to="/" v-slot="{ href, route, navigate, isActive, isExactActive}">さがす</router-link></li>
                <li><router-link to="/index_room" v-slot="{ href, route, navigate, isActive, isExactActive}">メッセージ</router-link></li>
                <li><router-link to="/follower" v-slot="{ href, route, navigate, isActive, isExactActive}">マッチング</router-link></li>
                <li><router-link to="/match" v-slot="{ href, route, navigate, isActive, isExactActive}">お相手から</router-link></li>
                <li><router-link to="/profile" v-slot="{ href, route, navigate, isActive, isExactActive}">プロフィール</router-link></li>
                <li><router-link to="/setting" v-slot="{ href, route, navigate, isActive, isExactActive}">設定</router-link></li>
          </ul>
    </div>
</div> 

<div class="table_frame">
  <router-view></router-view>
</div>
   
  </div>
</template>

<script>

export default {
  data: function () {
    return {
      
    }
  }
}


</script>

<style scoped>

</style>
