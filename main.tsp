import "@typespec/http";
import "./common.tsp";
import "./websites.tsp";

using Http;

@service(#{ title: "Widget Service" })
namespace DemoService;

enum WidgetColor {
  Red: "red",
  Blue: "blue",
}

model Widget {
  @visibility(Lifecycle.Read)
  id: string;

  weight: int32;
  color: WidgetColor;
}

model WidgetList {
  items: Widget[];
}

model AnalyzeResult {
  id: string;
  analysis: string;
}

@route("/widgets")
@tag("Widgets")
interface Widgets {
  /** List widgets */
  @get list(@query color?: WidgetColor): WidgetList | Error;
  //@get list(): WidgetList | Error;
  /** Read widgets */
  @get read(@path id: string): Widget | (NotFoundResponse & Error) | Error;
  /** Create a widget */
  @post create(@body body: OmitProperties<Widget, "id">): (CreatedResponse & Widget) | Error;
  /** Update a widget */
  @patch update(
    @path id: string,
    @body body: MergePatchUpdate<Widget>,
  ): Widget | (NotFoundResponse & Error) | Error;
  /** Delete a widget */
  @delete delete(@path id: string): void | (NotFoundResponse & Error) | Error;

  /** Analyze a widget */
  @route("{id}/analyze") @post analyze(@path id: string): AnalyzeResult | Error;
}
