<div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg">
        <br><br>
        <h1 class="header center orange-text">Pizzák</h1>
        <div class="row">
            <div class="col justify text-block">
                Lorem ipsum dolor, sit amet consectetur adipisicing elit. Blanditiis laudantium, mollitia aliquid culpa
                iure eos modi sunt sit error eum eius aliquam, ea laboriosam doloremque dicta cumque, incidunt vero
                quam!
                Voluptas recusandae eius corrupti dolore vel, est consequatur doloribus! Nobis cum molestiae officiis
                nihil consequatur adipisci animi aliquid odio unde dignissimos quo dolorum neque non, ad hic. Magnam,
                aut dicta.
            </div>
        </div>

        <br><br>



        <!--   Icon Section   -->
        <div class="row">
            <?php print product_list($connection)?>


        </div>

        <div class="row">
            <div class="col-12 center paginateion-holder" style="display:flex; justify-content: center;">
                <ul class="pagination">
                    <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
                    <li class="active"><a href="#!">1</a></li>
                    <li class="waves-effect"><a href="#!">2</a></li>
                    <li class="waves-effect"><a href="#!">3</a></li>
                    <li class="waves-effect"><a href="#!">4</a></li>
                    <li class="waves-effect"><a href="#!">5</a></li>
                    <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
                </ul>
            </div>
        </div>


    </div>
    <br><br>
</div>