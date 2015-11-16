#! /usr/bin/env python

import random, sys

colours = ["GRAY", "RED", "GREEN", "BLUE", "YELLOW", "BROWN", "PURPLE",]
template = """    {{
      "name": "{name}",
      "token": "{token}",
      "token_top": "{token_top}",
      "token_top_stripe": "{token_top_stripe}",
      "token_bottom": "{token_bottom}",
      "token_bottom_stripe": "{token_bottom_stripe}",
      "share_stripe": "{share_stripe}",
    }},"""

for company in file (sys.argv[1]):
  company = company.strip ()
  if not company: 
    continue
  token = "".join ([w[0].upper () for w in company.split (" ")])
  bottom_type = random.choice ("MD")
  bottom_colour = random.choice (colours)
  top_type = random.choice ("LM" if bottom_type == "M" else "MD")
  top_colour = random.choice (colours)
  bottom_stripe_type = random.choice ("LMD")
  bottom_stripe_colour = random.choice (["transparent", 
                                        random.choice (colours)])
  top_stripe_type = random.choice ("LMD")
  top_stripe_colour = random.choice (["transparent", 
                                     random.choice (colours)])
  def mk_colour (typ, colour):
    return (colour if colour == "transparent" 
            else ("${{{%s_%s}}}" % (typ, colour)))

  opts = {
    "name": company,
    "token": token,
    "token_top": mk_colour (top_type, top_colour),
    "token_top_stripe": mk_colour (top_stripe_type, top_stripe_colour),
    "token_bottom": mk_colour (bottom_type, bottom_colour),
    "token_bottom_stripe": mk_colour (bottom_stripe_type, bottom_stripe_colour),
    "share_stripe": mk_colour ("P", bottom_colour),
  }
  print template.format (**opts)
