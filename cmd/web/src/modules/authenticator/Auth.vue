<script setup>
import {Authenticator} from '@aws-amplify/ui-vue';
import '@aws-amplify/ui-vue/styles.css';
import {Auth} from 'aws-amplify'

try {
  const user = await Auth.currentUserInfo()
  console.log('user - ', user)
} catch (e) {
  console.error(e)
}

</script>
<template>
  <authenticator>
    <suspense>
      <template v-slot="{ user, signOut }">
        <h1>Hello {{ user.username }}!</h1>
        <button @click="signOut">Sign Out</button>
      </template>
    </suspense>
  </authenticator>
</template>