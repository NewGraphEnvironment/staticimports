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

# set up a table for the memos that contains the moti climate change data
sfpr_xref_moti_climate_names <- function(){
 tibble::tribble(
                                      ~spdsht,                                                                                                               ~report, ~description, ~id_join, ~id_side,
                          "pscis_crossing_id",                                                                                                   "pscis_crossing_id",         NA,     NA,     NA,
                      "my_crossing_reference",                                                                                               "my_crossing_reference",         NA,     NA,     NA,
                               "crew_members",                                                                                   "Crew Members Seperate with Spaces",         NA,     NA,     NA,
                      "moti_chris_culvert_id",                                                                                               "moti_chris_culvert_id",         NA,     NA,     NA,
                                "stream_name",                                                                                                         "stream_name",         NA,     NA,     NA,
                                  "road_name",                                                                                                           "road_name",         NA,     NA,     NA,
                             "erosion_issues",                                                                                      "Erosion (scale 1 low - 5 high)",         NA,     9L,     1L,
                     "embankment_fill_issues",                                                                  "Embankment fill issues 1 (low) 2 (medium) 3 (high)",         NA,     2L,     1L,
                            "blockage_issues",                                                                      "Blockage Issues 1 (0-30%) 2 (>30-75%) 3 (>75%)",         NA,     3L,     1L,
                             "condition_rank",                                                                    "Condition Rank = embankment + blockage + erosion",         NA,     4L,     1L,
                            "condition_notes",                                                                "Describe details and rational for condition rankings",         NA,     NA,     NA,
   "likelihood_flood_event_affecting_culvert",                                                     "Likelihood Flood Event Affecting Culvert (scale 1 low - 5 high)",         NA,     8L,     1L,
  "consequence_flood_event_affecting_culvert",                                                    "Consequence Flood Event Affecting Culvert (scale 1 low - 5 high)",         NA,     5L,     1L,
                  "climate_change_flood_risk",                           "Climate Change Flood Risk (likelihood x consequence) 1-6 (low) 6-12 (medium) 10-25 (high)",         NA,     6L,     1L,
                         "vulnerability_rank",                                                                  "Vulnerability Rank = Condition Rank + Climate Rank",         NA,     7L,     1L,
                              "climate_notes",                                                             "Describe details and rational for climate risk rankings",         NA,     NA,     NA,
                             "traffic_volume",                                                                         "Traffic Volume 1 (low) 5 (medium) 10 (high)",         NA,     9L,     2L,
                           "community_access", "Community Access - Scale - 1 (high - multiple road access) 5 (medium - some road access) 10 (low - one road access)",         NA,     2L,     2L,
                                       "cost",                                                                                       "Cost (scale: 1 high - 10 low)",         NA,     3L,     2L,
                           "constructability",                                                                      "Constructibility (scale: 1 difficult -10 easy)",         NA,     4L,     2L,
                               "fish_bearing",                                                             "Fish Bearing 10 (Yes) 0 (No) - see maps for fish points",         NA,     5L,     2L,
                      "environmental_impacts",                                                                       "Environmental Impacts (scale: 1 high -10 low)",         NA,     8L,     2L,
                              "priority_rank",  "Priority Rank = traffic volume + community access + cost + constructability + fish bearing + environmental impacts",         NA,     6L,     2L,
                               "overall_rank",                                                                   "Overall Rank = Vulnerability Rank + Priority Rank",         NA,     7L,     2L,
                             "priority_notes",                                                                 "Describe details and rational for priority rankings",         NA,     NA,     NA
  )
}
