#!/usr/bin/env node

const fs = require('fs')
const path = require('path')
const { promisify } = require('util')

const rename = promisify(fs.rename)
const symlink = promisify(fs.symlink)

const { execSync } = require('child_process');

async function checkAndBackupFile(file) {
    if (fs.existsSync(file)) {
        let dir = path.dirname(file)
        let filename = `${path.posix.basename(file)}.bkp`
        let destination = path.join(dir, filename)

        try {
            await rename(file, destination)
        } catch (err) {
            throw err
        }
        console.log(`Backed up ${file} to ${destination}`)
    }
}

async function symlinkFile(absolutePath, destination) {
    await checkAndBackupFile(destination)
    try {
        await symlink(absolutePath, destination)
    } catch (err) {
        throw err
    }
}

function dotfile(file) {
    return path.join(__dirname, '..', file)
}

const files = {}

files[dotfile('.zshrc')] = path.join(process.env.HOME, '.zshrc')
files[dotfile('.zsh')] = path.join(process.env.HOME, '.zsh')
files[dotfile('.zshenv')] = path.join(process.env.HOME, '.zshenv')
files[dotfile('.tmux.conf')] = path.join(process.env.HOME, '.tmux.conf')
files[dotfile('.config/alacritty')] = path.join(process.env.HOME, '.config/alacritty')
files[dotfile('.config/nvim')] = path.join(process.env.HOME, '.config/nvim')

Object.entries(files).forEach((entry) => {
    let key = entry[0]
    let value = entry[1]

    symlinkFile(key, value).then(() => {
        console.log(`symlinked ${key} into ${value}`)
    })
})