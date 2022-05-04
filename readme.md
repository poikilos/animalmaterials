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
You can change your mobs mod to depend on the animalmaterials mod or a
mod like it (mods like default and basic_materials use the same idea,
being low-level mods which primarily define materials for use by other
mods).
Then mods don't have to depend on your specific mobs mod and assume
which materials are present. Why is this important?

1. Other mods the users have are ones you don't maintain and for them to have
   free choice you should let them depend on a low-level mod instead of
   assuming they want everything from your mod.
2. Worse though about that fact, that a high-level mod like mobs redo assumes many things by
   the time it is loaded, is that if you changed mobs redo or another
   high-level mob like it, the code would become very divergent (you
   couldn't reuse as much code). For example, even just the fact that
   mobs redo defines chicken meat instead of using animalmaterials
   means that *every* mod that affects chicken must use the "mobs"
   namespace to access it, or add checks to see whether that or a
   different chicken is present--none of that would have to happen if
   mobs redo instead simply used animalmaterials and improved it if
   necessary (and for compatibility like this fork does, kept the exact
   same set of craftitems).
3. However, that isn't the worst part. The worst part is that every
   *lower-level* mod in the tree of dependencies including the things
   that those depend on and so on have no access to whatever mobs
   defines--such as meats in the case of mobs_redo--no mod already
   loaded (due to being in the dependency tree) can use them! There are
   probably cases other than mobs redo where this problem is even more
   disruptive. Even if mod B risked using the materials from the
   high-level mod A, there are two problems with that:
   - Mod B can't add the mod as a dependency nor an optional dependency
     because that would create a circular dependency. Not adding the
     mod as a dependency breaks the concept of dependencies: Mod B
     would assume things are there without listing requirements.
   - Mod B can't check for registered craftitems nor nodes:
     Mod B can't reliably check if there is one or another version of
     the mod if the mod changes or a different fork or replacement
     version of the mod is used. For example, if a mod depends on
     "farming", the mod still has to check whether certain craftitems
     or nodes are defined in order to determine whether
     minetest_game/farming or farming redo is installed. In that case,
     farming is a low-level mod and doesn't have any problems. However,
     if the mod that registered the items was a high-level mod with
     several dependencies like mobs redo, the circular dependency
     problem would occur: The mod wouldn't be loaded yet and mod B
     would have no way to check if something was registered. The
     solution is for both mod B and mobs redo to depend on a low-level
     mod like animalmaterials. See also "Why not add everything to
     default?" below.
4. Why not add everything to default? Having a low-level mod is a better
   solution than adding everything to default because if the
   registrations are in a separate mod, mod B and the high-level mod
   can require the low-level mod and have a reasonable assumption of
   what is in there, and if there is a known variant, the two mods can
   check what is registered. Checking for what is registered by default
   can become a problem if low-level items used for recipes,
   treasure/prizes mods, minigames, etc. may use them. Having
   boilerplate such as:
   `if minetest.registered_nodes["default:permafrost"] then`
   in every mod that depends on default is already technically
   necessary (if the node is used). That node isn't very important for
   recipes, treasure/prizes mods, minigames, etc., but it is already
   used by some mods and maybe a mob mod will want the creature to
   spawn there or a plantlife mapgen mod will want a certain plant to
   spawn there. Also, if default creeps to encompass nodes or
   craftitems those categories of mods use, then the registration
   checks will have to creep into mods in those or similar categories,
   in other words, a virtually unlimited number of mods.
   - The problem can get more complex if either default or another mod
     may define it. Then each high-level mod must optionally depend on
     both low-level mods, check for the registration in both namespaces,
     and store the id string of the one that is available in a variable
     for later use in the mod (The namespace is unknown so the ID can't
     be used directly).
5. As a positive solution, doing registrations in a low-level mod helps
   you cooperate with others by not creating duplicate materials such
   as ingredients or mapgen nodes in mods where you add features.

Here are a few examples of mods that consider those five facts:
1. cooking (This mod can solve the most frequent problems)
   - A mod which provides recipes for raw meat(s): This is a frequent issue
     since several advanced cooking mods exist which use specific meats
     or meat groups.
2. animalmaterials can be used by:
   - Any mod which provides specific mob(s)
   - Any mod which provides recipes for raw meat(s) (such as cooking)
3. Poikilos fork of nether (real example) can be used by:
   - A mod which defines the nether `*` (this would be a fork of nether or a new nether or nether-like mapgen mod)
   - Some odd mod which lets you obtain nether materials some other way `*`
   - A mod which defines nether fences but doesn't require a nether realm mod (maybe someone wants a museum or creative world with the materials but not the maintenance and space involved in having a nether realm). `*`
4. basic_materials (This mod solves the most disruptive problems) can be used by:
   - chains
   - homedecor
   - mesecons (but isn't yet... See ["mesecons should use my basic_materials mod"](https://github.com/minetest-mods/mesecons/issues/440)) issue by VanessaE)
   - technic
   - any mod that wants the materials for recipes or mapgen but doesn't want to require mesecons (or only wants mesecons or technic but not both)

`*`: Examples marked with `*` are only hypothetical and don't represent any mod(s) that I know to exist.


### What if I want different features than these simplistic items offer?
Depend on animalmaterials then use `minetest.override_item`. The Minetest
lua API has the function for one reason: to solve your issue! Not everyone wants
your specific lasso, but you can still have all the features you want
when you or they are using your specific lasso mod--problem solved. Then multiple mods
can utilize the same lasso or make new recipes for it and they only
ever need animalmaterials not some lasso in some specific namespace.
If you make animalmaterials an optional dependency rather
than a required one, simply check for it in your code (such as via
`rawget (_G, "animalmaterials")`), then if animalmaterials isn't
present, call `minetest.register_craftitem` instead of
`minetest.override_item` (then in the same case you can optionally make
an alias from the animalmaterials one to yours, such as if you want to
use an old world that contains animalmaterials items).

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

