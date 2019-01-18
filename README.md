# dotfiles

In this repository is where I record a personal Workspace, the files I track
within the /home directory. The repository is published offline and online to
promote accessibility and learning.

---

Why do I track files in the /home directory?
- The /home directory is expected to be the place where the User's configuration
  of Software is recorded. In contrast, the /etc directory is a place where
  Software is configured System-wide. There could be a '.bashrc' in /etc and
  /home — the user is able to further configure the 'bash' Software in their
  /home directory.
- When you bring up a new *nix environment, the System is configured as per the
  System Distribution (ie. Debian, Ubuntu, Arch). When you create a new User on
  this System, it may be designed to populate the User's directory in /home with
  default configurations for a new User. The new User's directory can be
  populated with files recoreded in a dotfile repository through the use of
  'git'. If access is available to an offline or online repository, then 'git'
  can retrieve the tracked and place it into the User's /home directory. The new
  User's directory is now populated with a Workspace familiar to the User;
  Software on the Machine can now acknowledge the User's configuration.
  
---

As per the LICENSE file, this repository has been introduced into the Public
domain. You are free to review and use the contents for whatever purpose without
attribution. I intend to share this repository and enable it to assist others.
