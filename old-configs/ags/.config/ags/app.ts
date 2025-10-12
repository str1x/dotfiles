import { App } from "astal/gtk4"
import style from "./styles/index.scss"

import Bar from "@/components/Bar"

App.start({
    css: style,
    main() {
        App.get_monitors().map(Bar)
    },
})
