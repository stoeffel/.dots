"use strict";

const os = require("os");
const path = require("path");

const originRoot = path.join(os.homedir(), ".dots");
const targetRoot = os.homedir();

const files = [
  {
    src: "gitconfig",
    dst: ".gitconfig"
  }]
const symlinks = [
  {
    dst: ".dots/brangelina.vim",
    src: ".brangelina.vim"
  },
  {
    dst: ".dots/brangelina.vim",
    src: ".vimrc"
  },
  {
    dst: ".dots/config.fish",
    src: ".config/fish/config.fish"
  },
  {
    dst: ".dots/fish/fish_user_key_bindings.fish",
    src: ".config/fish/functions/fish_user_key_bindings.fish"
  },
  {
    dst: ".dots/editorconfig",
    src: ".editorconfig"
  },
  {
    dst: ".dots/gitignore",
    src: ".gitignore"
  },
  {
    dst: ".dots/nvim-terminal-edit.py",
    src: "./bin/nvim-terminal-edit"
  },
  {
    dst: ".dots/install.sh",
    src: ".local/bin/dots"
  }
];

module.exports = { targetRoot, files, symlinks };
