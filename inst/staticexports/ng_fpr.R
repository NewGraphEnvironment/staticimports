# maintain up to date and complete road cost multiplier object
sfpr_xref_road_cost <- function(){
  tibble::tribble(
  ~my_road_class, ~my_road_surface, ~road_class_mult, ~road_surface_mult, ~cost_m_1000s_bridge, ~cost_embed_cv,
           "fsr",          "rough",               1L,                 1L,                  30L,           100L,
           "fsr",          "loose",               1L,                 1L,                  30L,           100L,
      "resource",          "loose",               1L,                 1L,                  30L,           100L,
        "permit",        "unknown",               1L,                 1L,                  30L,           100L,
        "permit",          "loose",               1L,                 1L,                  30L,           100L,
  "unclassified",          "loose",               1L,                 1L,                  30L,           100L,
  "unclassified",          "rough",               1L,                 1L,                  30L,           100L,
  "unclassified",          "paved",               1L,                 2L,                  50L,           150L,
  "unclassified",        "unknown",               1L,                 2L,                  50L,           150L,
         "local",          "loose",               4L,                 1L,                 100L,           200L,
         "local",          "paved",               4L,                 2L,                 200L,           400L,
      "arterial",          "paved",              15L,                 2L,                 750L,          1500L,
       "highway",          "paved",              15L,                 2L,                 750L,          1500L,
          "rail",           "rail",              15L,                 2L,                 750L,          1500L
  )
}
