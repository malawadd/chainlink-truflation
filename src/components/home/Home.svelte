
<script>
	const d = new Date();
	let year = d.getFullYear();
</script>

<style>
	.home {
		font-size: 20px;
		padding: 0 var(--base-padding);
		margin: 0 auto;
		max-width: 800px;
	}

	a {
	  cursor: pointer;
	  text-decoration: none;
	  color: var(--primary);
	}
	header {
	  padding-top: 100px;
	}

	header img {
	  height: 64px;
	}

	h1,h2,h3,h4,h5 {
	  margin: 0;
	  padding: 0;
	  font-weight: normal;
	}

	h1 {
	  line-height: 1.218;
	  font-size: 36px;
	  font-weight: 600;
	  letter-spacing: -0.045em;
	  margin-bottom: 64px;
	  margin-top: 16px;
	}

	.button-wrapper {
	  margin-bottom: 32px;
	}
	.button {
	  display: inline-block;
	  padding: 16px 32px;
	  border-radius: 50px;
	  font-weight: 650;
	  color: var(--primary-darkest);
	  background-color: var(--primary);
	  white-space: nowrap;
	  font-size: 110%;
	}

	section {
	  margin-bottom: 64px;
	}

	p, li {
	  line-height: 1.618;
	}

	h2 {
	  font-size: 32px;
	  line-height: 1.618;
	}

	.partners {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  gap: 50px;
	  margin-top: 48px;
	}

	.partners img {
	  min-height: 25px;
	  max-height: 50px;
	  filter: grayscale(100%);
	}

	footer {
	  border-top: 1px solid #555;
	  padding: 24px 0;
	}

	.copyright {
	  color: #888;
	}

</style>

<div class='home'>

  <header>
  
  	<h1>FlationDEX</h1>
  </header>

  <div class='body'> 

  	<section>

  		<h2>Hello!</h2>

  		<p>FlationDEX  lets you trade commedity markets like XAU/USD and XAG/USD with leverage. It is decentralized, open source, and accessible to everyone.</p>

  		

  		<div class='button-wrapper'>
  			<a class='button' href='/trade'>Start Trading ▸</a>
  		</div>

  	</section>

  	<section>

  		<h2>Features</h2>

  		<p>FlationDEX has all the features you need for fast and secure on-chain trading, including:</p>

  		<ul>
  			<li><strong>Cross Margin.</strong> Margin is shared between positions, minimizing liquidations.</li>
  			<li><strong>Risk Management.</strong> Set limit, stop, take-profit, and stop-loss.</li>
  			<li><strong>Dynamic Funding.</strong> Longs pay shorts (and vice versa) based on open interest.</li>
  			<li><strong>Trustless.</strong> Interact directly with on-chain smart contracts (no intermediaries).</li>
  		</ul>

  	</section>

  	<section>

  		<h2>How It Works</h2>

  		<p>You buy to profit from rising prices. You sell to profit from falling prices.</p>

  		<p>Your profits are paid from the pool. Your losses are paid to the pool.</p>

  		<ul>
  			<li>50% of trading fees go to the pool.</li>
  			<li>40% go to the treasury which buys back the protocol token, among other things.</li>
  			<li>10% go to keepers which trigger order executions.</li>
  		</ul>

  		<p>Your account is liquidated when its margin level reaches 20%.</p>

  		<p>All prices are provided in real-time on-chain by Chainlink.</p>

  	</section>

  	

  	<section class='dark'>

  		<h2>Partners</h2>

  		<div class='partners'>
			<!-- svelte-ignore a11y-missing-attribute -->
			<a href='' target='_blank'><img src='im/partners/chainlink.png'></a>
			<!-- svelte-ignore a11y-missing-attribute -->
			<a href='' target='_blank'><img src='im/partners/truflation.png'></a>
  		</div>
		

  	</section>

  </div>

  <footer>
  	<div class='copyright'>FlationDEX &copy; {year}</div>
  </footer>
  
</div>