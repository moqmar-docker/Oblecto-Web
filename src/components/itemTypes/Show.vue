<template>
  <li class="show">
    <div class="show-poster" v-bind:style="{ backgroundImage: 'url(' + host + '/series/' + showId + '/poster)' }">
      <a class="play" v-on:click="viewEpisodes"><i class="fa fa-eye" aria-hidden="true"></i></a>
      <div class="actions">
        <a class="action-item"v-on:click="openModal" title="Options">
          <i class="fa fa-info" aria-hidden="true"></i>
        </a>
      </div>
    </div>
    <div :title="title" class="title">{{ title }}</div>
    <div class="subtitle" v-if="subtitle">{{ subtitle }}</div>
  </li>
</template>

<script>
  import { mapState } from 'vuex'

  export default {
    name: 'show',
    props: ['title', 'subtitle', 'showId', 'show'],
    data () {
      return {}
    },
    computed: mapState([
      'host'
    ]),
    methods: {
      openModal: function (event) {
        this.$modal.show('actionShow', {show: this.show})
      },
      viewEpisodes: function (event) {
        this.$router.push({name: 'SeriesView', params: {seriesId: this.showId}})
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

  .show {
    display: inline-block;
    margin: 0 10px;

    width: 136px;
    position: relative;
  }

  .title {
    font-family: Roboto;
    font-size: 13px;

    width: 136px;

    margin-top: 5px;
    padding: 0;
    text-overflow: ellipsis;

    overflow: hidden;
    color: #eee
  }

  .subtitle {
    font-family: Roboto;
    font-size: 12px;

    width: 136px;

    margin-top: 5px;
    padding: 0;
    text-overflow: ellipsis;
    color: #aaa;

    overflow: hidden;
  }

  .show-poster {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;

    box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.75);

    background-color: rgba(0, 0, 0, 0.8);
    -webkit-background-size: cover;
    background-size: cover;
    background-position: center;

    height: 200px;
    width: 136px;

    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;

    border: 0 solid #ae6600;

    -webkit-transition: box-shadow 0.1s, opacity 0.1s;
    -moz-transition: box-shadow 0.1s, opacity 0.1s;
    -ms-transition: box-shadow 0.1s, opacity 0.1s;
    -o-transition: box-shadow 0.1s, opacity 0.1s;
    transition: box-shadow 0.1s, opacity 0.1s;

    position: relative;
    overflow: hidden;

    display: flex;
    align-items: center;
    justify-content: center;
  }


  .actions {
    position: absolute;
    bottom: -28px;
    text-align: right;
    -webkit-transition: bottom 0.2s;
    -moz-transition: bottom 0.2s;
    -ms-transition: bottom 0.2s;
    -o-transition: bottom 0.2s;
    transition: bottom 0.2s;
    width: 100%;
    padding: 5px;
    background-color: rgba(0, 0, 0, 0.5);
    overflow: visible
  }

  a {
    color: white;
    margin: 0 5px;
    cursor: pointer;
  }

  .show-poster:hover {
    box-shadow: 0px 0px 0px 2px rgba(174, 102, 0, 0.75);
  }

  .show-poster:hover .actions {
    bottom: 0;
  }

  .actions:hover {
    bottom: 0;
  }

  a.play {
    opacity: 0;
    display: block;
    font-size: 4em;
    margin: 0;
    width: 100px;
    height: 100px;
    background-color: rgba(0,0,0,0.5);
    border: 2px solid white;
    border-radius: 100%;
    text-align: center;
    line-height: 100px;
    -webkit-transition: opacity 0.2s;
    -moz-transition: opacity 0.2s;
    -ms-transition: opacity 0.2s;
    -o-transition: opacity 0.2s;
    transition: opacity 0.2s;
  }

  .show-poster:hover a.play{
    opacity: 0.4;
  }

  a.play:hover {
    opacity: 1!important;
  }
</style>
