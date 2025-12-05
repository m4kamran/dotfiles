return {
  "mfussenegger/nvim-jdtls",
  opts = {
    jdtls = {
      settings = {
        java = {
          project = {
            sourcePaths = {
              "src/main/java",
              "target/generated-sources/messaging-manifest",
              "target/generated-sources/annotations",
            },
          },
        },
      },
    },
  },
}
