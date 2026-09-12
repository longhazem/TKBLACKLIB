local TokaiHubTypes = require("./tokaihub/Library.d")

return {
    Library = (require("./tokaihub/Library") :: any) :: TokaiHubTypes.Library,
    Types = require("./tokaihub/Library.d"),
    SaveManager = require("./addons/SaveManager"),
    ThemeManager = require("./addons/ThemeManager")
}
