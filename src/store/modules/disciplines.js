import http from '../../http';
import {all, spread} from 'axios';

const state = {
    records: [],
    filters: [],
    meta: {}
};

const getters = {
    records: state => state.records,
    meta: state => state.meta,
    filters: state => state.filters,
    selected: state => state.filters.filter(f => f.selected),
    selectedClasses: (state, getters) =>  {
        return getters.selected.filter(f => f.data_type === 'class')
            .map(c => c.name);
    },
    selectedDisciplines: (state, getters) => {
       return getters.selected.filter(f => f.data_type === 'disc')
            .map(d => d.name);
    }

};

const mutations = {
    'SET_RECORDS'(state, records) {
        state.records = records;
    },
    'SET_META'(state, meta) {
        state.meta = meta;
    },
    'SET_FILTERS'(state, filters) {
        state.filters = filters;
    },
    'SET_FILTER_STATE'(state, payload) {
        state.filters[payload.index].selected = payload.checked;
    }
}

const actions = {

    changeFilterState({commit}, payload) {
        commit('SET_FILTER_STATE', payload);
    },
    
    initFilters({commit}) {
        const classes = http.get('/classes/names');
        const disciplines = http.get('/disciplines/types');

        all([classes, disciplines])
            .then(spread((res1, res2) => {
               
                console.log(res1);
                console.log(res2);

                const c = res1.data.classes.map(c => {
                    return { name: c, selected: false, data_type: 'class' };
                });

                const d = res2.data.types.map(d => {
                    return { name: d, selected: false, data_type: 'disc' };
                });

                commit('SET_FILTERS', c.concat(d));
            }));
    },

    initDisciplines({commit, state}, params) {

        let endPoint = '/disciplines';
        
        http.get(endPoint, {params})
        .then(res => {
          if (res.data.disciplines.results.length > 0) {
            console.log(res.data.disciplines.meta);
            commit('SET_RECORDS', res.data.disciplines.results);
            commit('SET_META', res.data.disciplines.meta);            
          }
        })
        .catch(e => console.log(e.response.message || e.response.data));
    }
}

export default {
    state,
    getters,
    mutations,
    actions
}