# zsh Plugin auto-installer

oh-my-zsh plugin. With this plugin you can install another plugins just typing "zshplugin <plugin name>", or if you have a link to the plugins folder (~/.oh-my-zsh/plugins), you can use the ls autocomplete to select the right plugin.

## How to install

Create a folder in ~/.oh-my-zsh/custom/plugins:
  <pre><code>mkdir ~/.oh-my-zsh/custom/plugins/zshinstall/</pre></code>

Put the zshplugin.zsh on the folder. After that, create an alias to in the .zshrc like this:
  <pre><code>alias zshplugin="~/.oh-my-zsh/custom/plugins/zshinstall/zshplugin.zsh"</pre></code>

To create the link with the plugins folder, just run the following command on your home directory (only works on the home folder):
   <pre><code>ln -s ~/.oh-my-zsh/plugins plugins</pre></code>

And that's it!

## Usage

If you are in the home folder and created the link (with this link you will be able to "navigate" the plugins), just type:
  <pre><code>$ zshplugin plugins/"name of the plugin"</pre></code>

If you haven't created the link, just use:
  <pre><code>$ zshplugin "name of the plugin"</pre></code>

## Help to improve

I'm trying to set a completion to this plugin, but i'm having some problems with the <strong>zshcompsys</strong>. So if you want to help me, fork the project.

## Screenshots

Selection the plugin with the ls
![Selecting the plugin with the ls](http://i.imgur.com/lwWudIn.png)

When the plugin is instaled

![When the plugin is instaled](http://i.imgur.com/G6J8Wg6.png)
