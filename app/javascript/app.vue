<template>
  <div id="app-11">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>name</th>
          <th>sex</th>
        </tr>
        <tr v-for="u in users" :key="u.id">
          <td>{{ u.id }}</td>
          <td>{{ u.name }}</td>
          <td>{{ u.sex }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      users: []
    }
  },
  mounted () {
    axios
      .get('/users.json')
      .then(response => (this.users = response.data))
  }
}
</script>