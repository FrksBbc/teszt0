<div class="section no-pad-bot" id="index-banner">
    <div class="container alpha-bg">
        <br><br>
        <h1 class="header center orange-text">Bemutatkozás</h1>
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
        <div class="row center">
            <a href="<?php print public_path('/product_list');?>" id="download-button"
                class="btn-large waves-effect waves-light orange">Tekintsd át a kínálatunkat</a>
        </div>
        <br><br>



        <!--   Icon Section   -->
        <div class="row">

            <?php print hot_deals($connection); ?>


        </div>

    </div>
    <br><br>
</div>