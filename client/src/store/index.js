import disciplines from './modules/disciplines';
import Vuex from 'vuex';
import Vue from 'vue';

Vue.use(Vuex);

const modules = {
    disciplines
};

// export default new Vuex.Store({modules});

export default new Vuex.Store({
    state: {
        isLoading: false
    },
    getters: {
        isLoading: state => state.isLoading
    },
    mutations: {
        'SET_IS_LOADING'(state, status) {
            state.isLoading = status;
        }
    },
    actions: {
        setLoading({commit}, boolean) {
            commit('SET_IS_LOADING', boolean);
        }
    },
    modules
})