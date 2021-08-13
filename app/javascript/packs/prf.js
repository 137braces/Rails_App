new Vue({
            el: '#app-users',
            data: {
                isModalActive : false,
                searchC : false
                
            },
            methods: {
                        openModal: function () {
                            this.searchC = true
                        },
                        closeModal: function () {
                            this.searchC = false
                        },
                        activePrf: function () {
                            this.isModalActive = false
                        }
                        
                     }
                     
        });