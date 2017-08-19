<template>
    <div class="tf-pagination" v-if="pageData && pageData.totalPages > 0">
        <ol>
            <li><a @click.prevent="previousPage">&lt;</a></li>
            <li 
                v-for="page in pageData.totalPages"
                :key="page"><a href="#" @click.prevent="setPage(page)">{{page}}</a></li>
            <li> <a @click.prevent="nextPage">&gt;</a></li>
        </ol>
    </div>
</template>

<script>
export default {
  props: {
      pageData: {
          type: Object,
          required: true
      },

      updateFunction: {
          type: Function,
          required: true
      }


  },

  data() {
      return {
          currentPage: 1,
      }
  },

  watch: {
    currentPage(n) {
        if (this.currentPage > this.pageData.totalPages) {
            this.currentPage =  1;
        }

        this.updateFunction(n);
    }
  },

  computed: {
      hasMore() {
          return this.currentPage < this.pageData.totalPages;
      }
  },

  methods: {
      previousPage() {
          if (this.currentPage > 1) {
              this.currentPage--;
          } 
      },
      nextPage() {
          if (this.currentPage < this.pageData.totalPages) {
              this.currentPage++;
          }
      },
      setPage(n) {
          if (this.currentPage !== n) {
            this.currentPage = n;
          }    
      }
  }
}
</script>

<style lang="scss">
.tf-pagination {
    width: 100%;
    ol {
        list-style-type: none;
        -webkit-padding-start: 0;
        li {
            display: inline;
            border-radius: 4px;
            background-color: #333;
            color: #f1f1f1;
            text-shadow: inset 1px 0 0 rgba(55,55,55,0.5);
            box-shadow: 0 3px 3px rgba(55,55,55,0.5);
            padding: 5px;
            a {
                color: #f1f1f1;
                text-decoration: none;
                &:hover {
                    color: red;
                }
            }
        }
    }
}
</style>
