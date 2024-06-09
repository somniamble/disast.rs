# Que Es?

I wanted to figure out a reliable, minimal way of getting
_exactly_ the setup I want to hack on. basically.

I was going to use Docker for this but decided to just do it live

## Some dependencies

### SSH
NEed to figure out ssh-agent stuff OR have a running connection with the
following host config in `.ssh/config`:

```config
host *
  ControlMaster auto
  ControlPath ~/.ssh/ssh_mux_%h_%p_%r
```

### Domain name
Your ssh host needs to be named the same thing as your site's domain name

Your domain name needs to actually point at the running site's IP

### Alpine linux version

This was tested against Alpine linux 3.15, since that's what capsul offers

# TODO
- [ ] Automated cert renewel
- [ ] Put the certbot config for disast.rs in another file, and include that from nginx.conf?
