# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Flashtag.Repo.insert!(%Flashtag.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import Flashtag.Factory

categories = insert_list(3, :blog_category)
tags = insert_list(6, :blog_tag)
series = insert(:blog_series)

insert_list(10, :blog_post)
insert_list(5, :blog_post, category: Enum.random(categories), tags: Enum.take_random(tags, 2))
insert_list(3, :blog_post, category: Enum.random(categories), tags: Enum.take_random(tags, 2), series: series)
