import "@typespec/http";
import "./common.tsp";

using Http;

namespace DemoService;

model Website {
  @visibility(Lifecycle.Read)
  id: string;

  name: string;
  url: string;
  description?: string;
}

@route("/websites")
@tag("Websites")
interface Websites {
  /** List websites */
  @get list(@query name?: string): Website[] | Error;

  /** Read a website */
  @get read(@path id: string): Website | (NotFoundResponse & Error) | Error;

  /** Create a website */
  @post create(@body body: Website): (CreatedResponse & Website) | Error;

  /** Update a website */
  @patch update(
    @path id: string,
    @body body: MergePatchUpdate<Website>,
  ): Website | (NotFoundResponse & Error) | Error;

  /** Delete a website */
  @delete delete(@path id: string): void | (NotFoundResponse & Error) | Error;
}
