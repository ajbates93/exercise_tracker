// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  ssr: false,

  future: {
    compatibilityVersion: 4,
  },

  devtools: { enabled: true },
  modules: ["vuetify-nuxt-module", "@nuxt/ui"],
  compatibilityDate: "2024-08-25",
});