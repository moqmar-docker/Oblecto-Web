<template>
  <modal name="actionShow" @before-open="beforeOpen">
    <div class="container">
      <h3>{{ show.seriesName }}</h3>
      <ul>
        <li>
          <a href="#" v-on:click="indexShow">Re-index show</a>
        </li>
        <li>
          <a href="#" v-on:click="modifyShow">Edit show data</a>
        </li>
      </ul>
    </div>
  </modal>
</template>

<script>
  export default {
    name: 'show-dialog',
    data () {
      return {
        show: {}
      }
    },
    methods: {
      beforeOpen (event) {
        this.show = event.params.show
      },
      modifyShow: function () {
        this.$modal.show('modifyShow', {show: this.show})
        this.$modal.hide('actionShow')
      },
      indexShow: function () {
        this.axios.get('/series/' + this.show.id + '/index')
          .then(response => {
            this.$notify({
              group: 'system',
              title: 'Library update requested successfully for ' + this.show.seriesName,
              text: 'A library index update has been started',
              type: 'warning'
            })
          })
          .catch(e => {})
      }
    }
  }
</script>

<style scoped lang="sass">

  h3
    width: 100%
    color: white
    margin: 0
    margin-bottom: 10px
    padding: 20px

    background-color: rgba(0,0,0,0.3)

    box-shadow: 0px 0px 5px 2px rgba(darken(darken(#696060,17) + #000000,6), 0.75)

  ul
    list-style: none
    padding: 0
    margin: 0
    li
      a
        display: inline-block
        width: 100%
        padding: 10px 20px
        color: white
        text-decoration: none

        -webkit-transition: background-color 0.1s
        -moz-transition: background-color 0.1s
        -ms-transition: background-color 0.1s
        -o-transition: background-color 0.1s
        transition: background-color 0.1s
      a:hover
        background-color: rgba(0,0,0,0.1)
        box-shadow: 0px 0px 2px 2px rgba(darken(darken(#696060,17) + #000000,6), 0.2)

</style>
