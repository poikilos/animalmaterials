# animalmaterials
The purpose of the animalmaterials modpack is to provide low-level mods
that don't depend on anything so that multiple mods can integrate with
the same meats. For example, cooking depends on animalmaterials and
doesn't have to depend on any specific mobs mod.

The Poikilos fork is a fork of AntumMT's fork of sapier's
animalmaterials modpack (the dependency on mobs was removed from this
fork though the antum branch was used).

## Project Status
The ideas behind this are still being explored so rather high-level
stuff like animal_resources and mob_environments are still here.
They may be moved elsewhere. For now, I suggest only using the following
mods from this modpack:
- animalmaterials
- cooking (optionally)

## Authors & License
See the individual mod folders.

## What other mods can do to be better

See the related 2022-05-04 poikilos.org article:
"Use animalmaterials for Minetest mods: low-level dependencies for better architecture"

### Why not just depend on mobs or whatever mod redefines these items?
The problems revolve around having too many assumptions (both
materials and behaviors code already loaded) by the time a high-level
mod (mobs in this case) is loaded. You can avoid circular dependencies
easily, but the fact that people run into them indicates that the
dependency tree is counter-intuitive.

If you define something as simple as raw chicken in your mobs mod, you
will forever force people to depend on a complex high-level mod (mobs
in this case) even if they simply want to create something simple such
as cooking recipes. This modpack and the ideas behind it are a way to
make dependencies easier to understand and make mods and mod
integration (cooperation between projects) easier without duplicate
items in multiple namespaces.

