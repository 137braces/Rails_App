import Vue from 'vue'
import App from '../app.vue'

 new Vue({
            el: '#app-users',
            data: {
                searchC : false,
                isActive: true
            },
            methods: {
                        search: function () {
                            this.searchC == true ? this.searchC = true : this.searchC = true
                        },
                        closeSearch: function () {
                            if (this.searchC == false) {
                               this.searchC = false
                               return {
                                   isActive :false
                               }
                            }
                        }
                     }
        });