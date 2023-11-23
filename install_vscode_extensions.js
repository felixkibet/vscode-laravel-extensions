import { execSync } from 'child_process';
import { forEach } from './extensions.json';

console.log('🚀 Checking and installing VSCode extensions...');

forEach(extension => {
    if (execSync(`code --list-extensions`).toString().includes(extension)) {
        console.log(`✅ ${extension} already installed.`);
    } else {
        console.log(`⬇️ Installing ${extension}...`);
        execSync(`code --install-extension ${extension}`, { stdio: 'inherit' });
    }
});

console.log('🎉 Installation successful!');
